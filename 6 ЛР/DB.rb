module DB
	require_relative "../4 ЛР/Client"
	require_relative "../4 ЛР/Loan"

	require 'mysql2'
	require 'date'
	
	include ClientModule
	include LoanData

	class DriverDB
		@instance = nil
		
		def initialize
			@client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "pawnshop")
		end
		
		private_class_method :new
		
		def self.getInstance
			if @instance == nil
				@instance = new
			end
			@instance
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
			rescue
				
			end
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
			rescue
			end
		end
		
		def clearLoansTable
			@client.query("DELETE FROM loans")
		end
		
		def close
			@client.close
		end
		
		def createClientFromDBEntry(row)
			
			passportData = PassportData.new(row["passportSeries"], row["passportNumber"], row["citizenship"], row["passportIssuedBy"], row["passportIssueDate"].strftime("%d.%m.%y"))
				
			client = Client.new(row["surname"], row["name"], row["patronymic"], row["birthDate"].strftime("%d.%m.%y"), passportData, row["address"])
			
			client
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