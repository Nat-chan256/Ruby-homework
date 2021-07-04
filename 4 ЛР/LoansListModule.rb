module LoansListModule
	require_relative "Client"
	include ClientModule
	require 'date'

	class LoansList 
		attr_reader :loansList 

		def initialize
			@loansList = Array.new
		end

		def addLoan(loan)
			@loansList << loan
		end

		def addLoans(loans)
			@loansList = @loansList + loans
		end

		def addToDB
			dbInstance = DriverDB.getInstance
			dbInstance.addLoansToDB(@loansList)
		end

		# Updates the loan in DB
		def changeLoan(loan)
			updateLoan(loan)
			dbInstance = DriverDB.getInstance
			dbInstance.changeLoan(loan)
		end

		def deleteLoan(loan)
			remove(loan)
			dbInstance = DriverDB.getInstance
			dbInstance.deleteLoan(loan)
		end

		def findLoanByClientFullNameAndGrantingDate(surname, name, patronymic, grantingDate)
			fullName = "#{surname} #{name} #{patronymic}"
			if not Client.isFullName(fullName)
				raise "ФИО некорректно"
			end
			fullName = Client.normalizeFullName(fullName)

			if not Client.isDate(grantingDate)
				raise "Дата некорректна"
			end
			grantingDate = Client.normalizeDate(grantingDate)

			loansList.select{|loan| loan.client.fullName == fullName and loan.grantingLoanDate == grantingDate}
		end

		def remove(loanToRemove)
			@loansList.delete_if {|loan| loan.client.passportData.series == loanToRemove.client.passportData.series and loan.client.passportData.number == loanToRemove.client.passportData.number and loan.grantingLoanDate == loanToRemove.grantingLoanDate}
		end

		def sortByClientFullName!
			@loansList.sort_by!{|loan| "#{loan.client.fullName}"}
		end

		def sortByGrantingDate!
			@loansList.sort_by!{|loan| Date.parse(loan.grantingLoanDate)}
		end

		def sortByMortgatedPropertyCount!
			@loansList.sort_by!{|loan| loan.mortgagedPropertyDict.length}
		end

		def sortByRepaymentDate!
			@loansList.sort_by!{|loan| Date.parse(loan.loanRepaymentDate)}
		end

		def to_s
			@loansList.join("\n\n")
		end

		def updateLoan(loanToUpdate)
			@loansList.each{|loan| loan = loanToUpdate if loan.client.passportData.series == loanToUpdate.client.passportData.series and loan.client.passportData.number == loanToUpdate.client.passportData.number and loan.grantingLoanDate == loanToUpdate.grantingLoanDate}
		end

	end
end