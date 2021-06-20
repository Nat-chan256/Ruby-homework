require_relative "ClientsListModule"
require_relative "Loan"
require_relative "LoansListModule"

include ClientsListModule
include LoanData
include LoansListModule

passportData1 = PassportData.new("0913", "667788", "Российская Федерация",  
				"Отделение УФМС России по гор. Москва по району Камовники", "08.09.2014") 
ivan = Client.new("Иванов", "Иван", "Иванович",  "20.07.1969", passportData1, "Красная д.14 кв.28")

passportData2 = PassportData.new("1315", "151411", "Российская Федерация",  
	"Отдел внутренних дел по гор. Москва по району Камовники", "01.03.2019") 
elena = Client.new("Октябрьская", "Елена", "Ивановна",  "18.02.1999", passportData2, "40-летия победы д.58 кв.117") 

passportData3 = PassportData.new("1011", "999999", "Российская Федерация",  
	"ТП №75 отдела УФМС по гор. Москва по району Камовники", "29.09.2000") 
anna = Client.new("Цветкова", "Анна", "Витальевна",  "09.09.1980", passportData3, "Орджиникидзе д.114") 

clientsList = ClientsList.new
clientsList.addClient(ivan)
clientsList.addClient(elena)
clientsList.addClient(anna)

puts "СОРТИРОВКА ПО АДРЕСУ"
clientsList.sortByAddress!
puts clientsList

puts "\n\n\nСОРТИРОВКА ПО ДАТЕ РОЖДЕНИЯ"
clientsList.sortByBirthDate!
puts clientsList

puts "\n\n\nСОРТИРОВКА ПО ИМЕНИ"
clientsList.sortByName!
puts clientsList

puts "\n\n\nСОРТИРОВКА ПО ОТЧЕСТВУ"
clientsList.sortByPatronymic!
puts clientsList

puts "\n\n\nСОРТИРОВКА ПО ПАСПОРТНЫМ ДАННЫМ"
clientsList.sortByPassportData!
puts clientsList

puts "\n\n\nСОРТИРОВКА ПО ФАМИЛИИ"
clientsList.sortBySurname!
puts clientsList


mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
loan1 = Loan.new(ivan, "13.03.21", "04.11.21", mortgagedPropertyDict)  
loan2 = Loan.new(elena, "24.05.21", "24.06.21", {"Золотой кулон с бриллиантами" => 40000})  
loan3 = Loan.new(anna, "14.04.2021", "21.04.2021", {"Наручные часы" => 15000}) 

loansList = LoansList.new
loansList.addLoan(loan1)
loansList.addLoan(loan2)
loansList.addLoan(loan3)


puts "============================================"
puts "\nСОРТИРОВКА ПО ФИО КЛИЕНТА"
loansList.sortByClientFullName!
puts loansList

puts "\n\n\nСОРТИРОВКА ПО ДАТЕ ВЫДАЧИ ЗАЙМА"
loansList.sortByGrantingDate!
puts loansList

puts "\n\n\nСОРТИРОВКА ПО КОЛИЧЕСТВУ ЗАЛОГОВОГО ИМУЩЕСТВА"
loansList.sortByMortgatedPropertyCount!
puts loansList

puts "\n\n\nСОРТИРОВКА ПО ДАТЕ ВОЗВРАТА ЗАЙМА"
loansList.sortByRepaymentDate!
puts loansList