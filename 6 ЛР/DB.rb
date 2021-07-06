module DB
	require_relative "../4 ЛР/Client"
	require_relative "../4 ЛР/Loan"
	require_relative "../4 ЛР/ClientsListModule"
	require_relative "../4 ЛР/LoansListModule"

	require 'mysql2'
	require 'date'
	
	include ClientModule
	include LoanData
	include ClientsListModule
	include LoansListModule

	class DriverDB
		attr_reader :clientsList, :loansList
		@instance = nil
		
		def initialize
			@client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "pawnshop")
			@clientsList = readClientsList
			@loansList = readLoansList
		end
		
		private_class_method :new
		
		def self.getInstance
			if @instance == nil
				@instance = new
			end
			@instance
		end
		
		def addClientsToDB(clients)
			clients.each{|client| addClientToDB(client)}
		end
		
		def addClientToDB(client)
			surname = @client.escape(client.surname)
			name = @client.escape(client.name)
			patronymic = @client.escape(client.patronymic)
			birthDate = Date.parse(@client.escape(client.birthDate)).to_s
			passportSeries = @client.escape(client.passportData.series)
			passportNumber = @client.escape(client.passportData.number)
			citizenship = @client.escape(client.passportData.citizenship)
			issuedBy = @client.escape(client.passportData.issuedBy)
			issueDate = Date.parse(@client.escape(client.passportData.issueDate)).to_s
			address = @client.escape(client.address)
			
			begin
				@client.query("INSERT INTO clients VALUES ('#{surname}', '#{name}', '#{patronymic}', '#{passportSeries}', '#{passportNumber}', '#{citizenship}', '#{issuedBy}', '#{issueDate}', '#{address}', '#{birthDate}')")
				
				@clientsList.addClient(client)
			rescue
				
			end
		end
		
		def addLoansToDB(loans)
			loans.each {|loan| addLoanToDB(loan)}
		end
		
		def addLoanToDB(loan)
			passportSeries = @client.escape(loan.client.passportData.series)
			passportNumber = @client.escape(loan.client.passportData.number)
			grantingDate = Date.parse(loan.grantingLoanDate).to_s
			repaymentDate = Date.parse(loan.loanRepaymentDate).to_s
			
			begin
				# Insert loan
				@client.query("INSERT INTO loans(clientPassportSeries, clientPassportNumber, grantingDate, repaymentDate) VALUES ('#{passportSeries}', '#{passportNumber}', '#{grantingDate}', '#{repaymentDate}')")
				
				# Insert appropriate property
				loanId = @client.query("SELECT MAX(id) FROM loans")
				id = 0
				
				loanId.each{|row| id = row["MAX(id)"]}
				
				loan.mortgagedPropertyDict.keys.each do |key| 
					propertyName = @client.escape(key)
					
					sql = "INSERT INTO mortgagedProperty VALUES(#{id}, '#{propertyName}', #{loan.mortgagedPropertyDict[key]})"
					
					@client.query(sql)
				end
				@loansList.addLoan(loan)
			rescue
			end
		end
		
		def changeClient(clientWithNewData)
			surname = @client.escape(clientWithNewData.surname)
			name = @client.escape(clientWithNewData.name)
			patronymic = @client.escape(clientWithNewData.patronymic)
			birthDate = Date.parse(@client.escape(clientWithNewData.birthDate)).to_s
			passportSeries = @client.escape(clientWithNewData.passportData.series)
			passportNumber = @client.escape(clientWithNewData.passportData.number)
			citizenship = @client.escape(clientWithNewData.passportData.citizenship)
			issuedBy = @client.escape(clientWithNewData.passportData.issuedBy)
			issueDate = Date.parse(@client.escape(clientWithNewData.passportData.issueDate)).to_s
			address = @client.escape(clientWithNewData.address)
		
			sql = "UPDATE clients SET surname = '#{surname}', name = '#{name}', patronymic = '#{patronymic}', citizenship = '#{citizenship}', passportIssuedBy = '#{issuedBy}', passportIssueDate = '#{issueDate}', address = '#{address}', birthDate = '#{birthDate}' WHERE passportSeries = '#{passportSeries}' AND passportNumber = #{passportNumber}"
			
			@client.query(sql)
			
			@clientsList.updateClient(clientWithNewData)
		end
		
		def changeLoan(loan)
			passportSeries = @client.escape(loan.client.passportData.series)
			passportNumber = @client.escape(loan.client.passportData.number)
			grantingDate = Date.parse(loan.grantingLoanDate).to_s
			repaymentDate = Date.parse(loan.loanRepaymentDate).to_s
			
			begin
				# Insert loan
				@client.query("UPDATE loans SET grantingDate = '#{grantingDate}', repaymentDate = '#{repaymentDate}' WHERE clientPassportSeries = '#{passportSeries}' AND clientPassportNumber = '#{passportNumber}'")
				
				# Insert appropriate property
				id = findLoanId(loan)
				
				removeMortgagedPropertyWithLoanId(id)
				
				loan.mortgagedPropertyDict.keys.each do |key| 
					propertyName = @client.escape(key)
					
					sql = "INSERT INTO mortgagedProperty VALUES(#{id}, '#{propertyName}', #{loan.mortgagedPropertyDict[key]})"
					
					@client.query(sql)
				end
				@loansList.updateLoan(loan)
			rescue
			end
		end
		
		def clearLoansTable
			@client.query("DELETE FROM loans")
		end
		
		def close
			serialize
			@client.close
		end
		
		def createClientFromDBEntry(row)
			passportData = PassportData.new(row["passportSeries"], row["passportNumber"], row["citizenship"], row["passportIssuedBy"], row["passportIssueDate"].strftime("%d.%m.%y"))
				
			client = Client.new(row["surname"], row["name"], row["patronymic"], row["birthDate"].strftime("%d.%m.%y"), passportData, row["address"])
			
			client
		end
		
		def deleteClient(client)
			@client.query("DELETE FROM clients WHERE passportSeries = '#{client.passportData.series}' AND passportNumber = #{client.passportData.number}")
			@clientsList.remove(client)
		end
		
		def deleteLoan(loan)
			id = findLoanId(loan)
			@client.query("DELETE FROM mortgagedProperty WHERE loanId = #{id}")
			@client.query("DELETE FROM loans WHERE id = #{id}")
			@loansList.remove(loan)
		end
		
		def findLoanId(loan)
			loanId = @client.query("SELECT * FROM loans WHERE clientPassportSeries = '#{loan.client.passportData.series}' AND clientPassportNumber = '#{loan.client.passportData.number}'") #AND grantingDate = '#{loan.grantingLoanDate}'")
			id = 0	
			loanId.each{|row| id = row["id"]}
			id
		end
		
		def flush
			@client.query("DELETE FROM mortgagedProperty")
			@client.query("DELETE FROM loans")
			@client.query("DELETE FROM clients")
			@clientsList = ClientsList.new
			@loansList = LoansList.new
		end
		
		def readClientsList
			clientsList = ClientsList.new
			clientsFromDB = selectClients
			clientsList.addClients(clientsFromDB)
			clientsList
		end
		
		def readLoansList
			loansList = LoansList.new
			loansFromDB = selectLoans
			loansList.addLoans(loansFromDB)
			loansList
		end
		
		def removeMortgagedPropertyWithLoanId(id)
			@client.query("DELETE FROM mortgagedProperty WHERE loanId = #{id}")
		end
		
		def selectClients
			clientsList = Array.new
			selectResult = @client.query("SELECT * from clients")
			selectResult.each do |row|
				client = createClientFromDBEntry(row)
				clientsList << client
			end
			clientsList
		end
		
		def selectLoans
			loansList = Array.new
			selectResult = @client.query("SELECT * from loans")
			selectResult.each do |row|
			
				# Create client
				clientQuery = @client.query("SELECT * FROM clients WHERE passportSeries = '#{row["clientPassportSeries"]}' AND passportNumber = '#{row["clientPassportNumber"]}'")
				client = nil
				clientQuery.each{|row| client = createClientFromDBEntry(row)}
				
				# Create mortgaged property hash
				mortgagedProperty = @client.query("SELECT * FROM mortgagedProperty WHERE loanId = #{row["id"]}")
				mortgagedPropertyHash = Hash.new
				mortgagedProperty.each {|row| mortgagedPropertyHash[row["propertyName"]] = row["cost"]}
				
				loan = Loan.new(client, row["grantingDate"].strftime("%d.%m.%y"), row["repaymentDate"].strftime("%d.%m.%y"), mortgagedPropertyHash)
				
				loansList << loan
			end
			loansList
		end
	
		def serialize
			@clientsList.writeListJSON("cleints.json")
			@loansList.writeListJSON("loans.json")
		end
	
		def showLoansTable
			selectResult = @client.query("SELECT * from loans")
			selectResult.each {|row| puts row}
		end
		
		def showMortgagedPropertyTable
			selectResult = @client.query("SELECT * from mortgagedProperty")
			selectResult.each {|row| puts row}
		end
		
	end
end