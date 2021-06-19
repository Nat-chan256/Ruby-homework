module LoanData
	class Loan
		attr_accessor :client, :grantingLoanDate, :loanRepaymentDate, :mortgagedPropertyDict

		def initialize(client, grantingLoanDate, loanRepaymentDate, mortgagedPropertyDict)
			self.client = client
			self.grantingLoanDate = grantingLoanDate
			self.loanRepaymentDate = loanRepaymentDate
			self.mortgagedPropertyDict = mortgagedPropertyDict
		end

		def to_s
			"ФИО клиента: #{self.client.surname} #{self.client.name} #{self.client.patronymic}
Дата выдачи займа: #{self.grantingLoanDate}
Дата возврата займа: #{self.loanRepaymentDate}
Список залогового имущества (вместе с оценкой стоимости): #{self.mortgagedPropertyDict}"
		end
	end
end