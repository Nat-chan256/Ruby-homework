require_relative "../4 ЛР/ClientsListModule"
require_relative "DB"

include DB
include ClientsListModule

# Read current data from DB
dbInstance = DriverDB.getInstance
dbInstance.flush

puts "СПИСОК КЛИЕНТОВ ДО СОЗДАНИЯ СПИСКА"
puts dbInstance.clientsList

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
clientsList.addToDB

puts "\n\n\n================================================"
puts "СПИСОК КЛИЕНТОВ ПОСЛЕ СОЗДАНИЯ СПИСКА"
puts dbInstance.clientsList

# Update clients data
tolik.fullName = "Астахов Анатолий Сергеевич"
clientsList.changeClient(tolik)
puts "\n\n\n================================================"
puts "КЭШ КЛИЕНТОВ ПОСЛЕ ИЗМЕНЕНИЯ КЛИЕНТА"
puts dbInstance.clientsList
puts "\n\n\n================================================"
puts "СОДЕРЖИМОЕ ТАБЛИЦЫ (БД) КЛИЕНТОВ ПОСЛЕ ИЗМЕНЕНИЯ КЛИЕНТА"
puts dbInstance.readClientsList



puts "\n\n\n================================================"
puts "СПИСОК ЗАЙМОВ ДО СОЗДАНИЯ СПИСКА"
puts dbInstance.loansList


# Create loans list
loansList = LoansList.new
mortgagedPropertyDict = {"Планшет Samsung" => 16000}
loan1 = Loan.new(vika, "17.08.20", "28.11.20", mortgagedPropertyDict)
loan2 = Loan.new(tolik, "24.05.21", "24.06.21", {"Золотой кулон с бриллиантами" => 40000})


loansList.addLoan(loan1)
loansList.addLoan(loan2)
loansList.addToDB

puts "\n\n\n================================================"
puts "КЭШ ЗАЙМОВ ПОСЛЕ СОЗДАНИЯ СПИСКА"
puts dbInstance.loansList
puts "\n\n\n================================================"
puts "СОДЕРЖИМОЕ ТАБЛИЦЫ ЗАЙМОВ ПОСЛЕ СОЗДАНИЯ СПИСКА"
puts dbInstance.readLoansList


# Update loans data
loan1.grantingLoanDate = "01.01.20"
loansList.changeLoan(loan1)
puts "\n\n\n================================================"
puts "КЭШ ЗАЙМОВ ПОСЛЕ ИЗМЕНЕНИЯ ЗАЙМА"
puts dbInstance.loansList
puts "\n\n\n================================================"
puts "СОДЕРЖИМОЕ ТАБЛИЦЫ (БД) ЗАЙМОВ ПОСЛЕ ИЗМЕНЕНИЯ ЗАЙМА"
puts dbInstance.readLoansList

# Remove loans
loansList.deleteLoan(loan1)
puts "\n\n\n================================================"
puts "КЭШ ЗАЙМОВ ПОСЛЕ УДАЛЕНИЯ ЗАЙМА"
puts dbInstance.loansList
puts "\n\n\n================================================"
puts "СОДЕРЖИМОЕ ТАБЛИЦЫ (БД) ЗАЙМОВ ПОСЛЕ УДАЛЕНИЯ ЗАЙМА"
puts dbInstance.readLoansList



# Remove clients
clientsList.deleteClient(vika)
puts "\n\n\n================================================"
puts "КЭШ КЛИЕНТОВ ПОСЛЕ УДАЛЕНИЯ КЛИЕНТА"
puts dbInstance.clientsList
puts "\n\n\n================================================"
puts "СОДЕРЖИМОЕ ТАБЛИЦЫ (БД) КЛИЕНТОВ ПОСЛЕ УДАЛЕНИЯ КЛИЕНТА"
puts dbInstance.readClientsList



dbInstance.close