require_relative "DB"
include DB

# Create clients
passportData1 = PassportData.new("0913", "667788", "Российская Федерация",  
				"Отделение УФМС России по гор. Москва по району Камовники", "08.09.2014") 
ivan = Client.new("Иванов", "Иван", "Иванович",  "20.07.1969", passportData1, "Красная д.14 кв.28")

passportData2 = PassportData.new("1315", "151411", "Российская Федерация",  
	"Отдел внутренних дел по гор. Москва по району Камовники", "01.03.2019") 
elena = Client.new("Октябрьская", "Елена", "Ивановна",  "18.02.1999", passportData2, "40-летия победы д.58 кв.117") 

passportData3 = PassportData.new("1011", "999999", "Российская Федерация",  
	"ТП №75 отдела УФМС по гор. Москва по району Камовники", "29.09.2000") 
anna = Client.new("Цветкова", "Анна", "Витальевна",  "09.09.1980", passportData3, "Орджиникидзе д.114") 

# Insert clients into database
dbInstance = DriverDB.getInstance

dbInstance.addClientToDB(ivan)
dbInstance.addClientToDB(elena)
dbInstance.addClientToDB(anna)

# Select clients
clientsList = dbInstance.selectClients
clientsList.each{|client| puts (client.to_s + "\n\n")}

# Create loans
mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
loan1 = Loan.new(ivan, "13.03.21", "04.11.21", mortgagedPropertyDict)  
loan2 = Loan.new(elena, "24.05.21", "24.06.21", {"Золотой кулон с бриллиантами" => 40000})  
loan3 = Loan.new(anna, "14.04.2021", "21.04.2021", {"Наручные часы" => 15000}) 

# Insert loans into database
dbInstance.addLoanToDB(loan1)
dbInstance.addLoanToDB(loan2)
dbInstance.addLoanToDB(loan3)

# Select loans
loansList = dbInstance.selectLoans
loansList.each{|loan| puts (loan.to_s + "\n\n")}

dbInstance.close