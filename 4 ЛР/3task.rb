require_relative "Client"
require_relative "Loan"

include ClientModule
include LoanData

passportData1 = PassportData.new("0913", "667788", "Российская Федерация",  "Отделение УФМС России по гор. Москва по району Камовники", 
	"09.08.2014")
ivan = Client.new("Иванов", "Иван", "Иванович",  "23.07.1969", passportData1, "Красная д.14 кв.28")

ivan.fullName = " иВанов иван   СЕРГЕЕВИЧ"
ivan.birthDate = "  20.07.69"

puts "ФИО: #{ivan.surname} #{ivan.name} #{ivan.patronymic}"
puts "Дата рождения: #{ivan.birthDate}"

passportData1.series = "     0909  "
passportData1.number = " 111111  "
passportData1.issueDate = "09.09.14"

puts "\n\nСерия паспорта: #{passportData1.series}"
puts "Номер паспорта: #{passportData1.number}"
puts "Дата выдачи паспорта: #{passportData1.issueDate}"

mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
loan = Loan.new(ivan, "13.3.2021", "4.11.2021", mortgagedPropertyDict)

loan.grantingLoanDate = "2.3.21"
loan.loanRepaymentDate = "    14.11.21   "

puts "\n\nДата выдачи займа: #{loan.grantingLoanDate}"
puts "Дата возврата займа: #{loan.loanRepaymentDate}"

# Exceptions
# ivan.fullName = "Просто иван"
# ivan.birthDate = "13/12/70"
# passportData1.series = "     09  "
# passportData1.number = " 1111111  "
# passportData1.issueDate = "09.13.14"
# loan.grantingLoanDate = "13/12/70"
# loan.loanRepaymentDate = "09.13.14"