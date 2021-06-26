require_relative "DB"
include DB

dbInstance = DriverDB.getInstance

# puts "СПИСОК КЛИЕНТОВ ДО ДОБАВЛЕНИЯ КЛИЕНТА"
# puts dbInstance.clientsList

passportData = PassportData.new("0001", "101010", "Российская Федерация",  
	"Отдел внутренних дел 'Гольяново' гор. Москвы", "10.08.2004") 
nastya = Client.new("Павлова", "Анастасия", "Евгеньевна",  "27.07.1979", passportData, "Петра Метальникова д.14") 
# dbInstance.addClientToDB nastya

# puts "\n\nСПИСОК КЛИЕНТОВ ПОСЛЕ ДОБАВЛЕНИЯ КЛИЕНТА"
# puts dbInstance.clientsList

puts "СПИСОК ЗАЙМОВ ДО ДОБАВЛЕНИЯ НОВОГО ЗАЙМА"
puts dbInstance.loansList

mortgagedPropertyDict = {"Планшет Samsung" => 16000}
loan = Loan.new(nastya, "17.08.20", "28.11.20", mortgagedPropertyDict)
dbInstance.addLoanToDB(loan)

puts "СПИСОК ЗАЙМОВ ПОСЛЕ ДОБАВЛЕНИЯ НОВОГО ЗАЙМА"
puts dbInstance.loansList

dbInstance.close