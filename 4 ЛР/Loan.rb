module LoanData
	class Loan
		attr_accessor :client, :grantingLoanDate, :loanRepaymentDate, :mortgagedPropertyDict

		def initialize(client, grantingLoanDate, loanRepaymentDate, mortgagedPropertyDict)
			self.client = client
			self.grantingLoanDate = grantingLoanDate
			self.loanRepaymentDate = loanRepaymentDate
			self.mortgagedPropertyDict = mortgagedPropertyDict
		end
	end
end