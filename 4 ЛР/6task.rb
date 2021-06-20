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

client1 = clientsList.findClientByFullName("Иванов", "Иван", "Иванович")
puts client1

client2 = clientsList.findClientByFullName("Головатый", "Евгений", "Андреевич")
puts client2

# Exception
# client3 = clientsList.findClientByFullName("1111", "222", "")

client1 = clientsList.findClientByPassportData("1315", "151411")
puts client1

client2 = clientsList.findClientByPassportData("1111", "111111")
puts client2

# Exception
# client3 = clientsList.findClientByPassportData("123", "some line")

mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
loan1 = Loan.new(ivan, "13.03.21", "04.11.21", mortgagedPropertyDict)  
loan2 = Loan.new(elena, "24.05.21", "24.06.21", {"Золотой кулон с бриллиантами" => 40000})  
loan3 = Loan.new(anna, "14.04.2021", "21.04.2021", {"Наручные часы" => 15000}) 

loansList = LoansList.new
loansList.addLoan(loan1)
loansList.addLoan(loan2)
loansList.addLoan(loan3)

loan1 = loansList.findLoanByClientFullNameAndGrantingDate("Цветкова", "Анна", "Витальевна", "14.04.2021")
puts loan1

loan2 = loansList.findLoanByClientFullNameAndGrantingDate("Иванов", "Иван", "Иванович", "14.04.2021")
puts loan2

# Exception
# loan3 = loansList.findLoanByClientFullNameAndGrantingDate("Цветкова", "Анна", "Витальевна", "14/15/2021")