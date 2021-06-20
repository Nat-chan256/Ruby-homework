module LoansListModule
	require_relative "Client"
	include ClientModule

	class LoansList 
		attr_reader :loansList 

		def initialize
			@loansList = Array.new
		end

		def addLoan(loan)
			@loansList << loan
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
	end
end