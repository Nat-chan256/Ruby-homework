require_relative "../4 ЛР/ClientsListModule"
require_relative "../4 ЛР/LoansListModule"
require_relative "../4 ЛР/Loan"

include ClientsListModule
include LoansListModule
include LoanData

# Create clients list
clientsList = ClientsList.new
passportData1 = PassportData.new("9494", "949494", "Российская Федерация",  
	"Отдел внутренних дел 'Гольяново' гор. Москвы", "10.08.2004") 
vika = Client.new("Романченко", "Виктория", "Викторовна",  "27.07.1979", passportData1, "Петра Метальникова д.14") 
passportData2 = PassportData.new("9509", "509509", "Российская Федерация",  
	"Отдел внутренних дел 'Гольяново' гор. Москвы", "10.08.2004") 
tolik = Client.new("Рубцов", "Анатолий", "Сергеевич",  "27.07.1979", passportData2, "Петра Метальникова д.14") 
clientsList.addClient(vika)
clientsList.addClient(tolik)

# Write to file
clientsList.writeListJSON("clientsJson.json")

# Read from file
clientsList2 = ClientsList.new
clientsList2.readListJSON("clientsJson.json")

# Output
puts "СОЗДАННЫЕ КЛИЕНТЫ"
puts clientsList

puts "\n\n========================="
puts "КЛИЕНТЫ, ПРОЧИТАННЫЕ ИЗ ФАЙЛА"
puts clientsList2

# Create loans list
loansList = LoansList.new
mortgagedPropertyDict = {"Планшет Samsung" => 16000}
loan1 = Loan.new(vika, "17.08.20", "28.11.20", mortgagedPropertyDict)
loan2 = Loan.new(tolik, "24.05.21", "24.06.21", {"Золотой кулон с бриллиантами" => 40000})

loansList.addLoan(loan1)
loansList.addLoan(loan2)

# Write to file
loansList.writeListJSON("loansJSON.json")

# Read from file
loansList2 = LoansList.new
loansList2.readListJSON("loansJSON.json", "clientsJson.json")

# Output
puts "\n\n========================="
puts "СОЗДАННЫЕ ЗАЙМЫ"
puts loansList

puts "\n\n========================="
puts "ЗАЙМЫ, ПРОЧИТАННЫЕ ИЗ ФАЙЛА"
puts loansList2