module TestModule
	require_relative "Client"
	require_relative "Loan"

	include ClientModule
	include LoanData

	require 'date'

	class TestClient
		attr_reader :clientsList

		def initialize
			@clientsList = Array.new
		end

		def createClients
			passportData1 = PassportData.new("0913", "667788", "Российская Федерация",  
				"Отделение УФМС России по гор. Москва по району Камовники", Date.new(2014, 8, 9))
			ivan = Client.new("Иванов", "Иван", "Иванович",  Date.new(1969, 7, 20), passportData1, "Красная д.14 кв.28")

			passportData2 = PassportData.new("1315", "151411", "Российская Федерация",  
				"Отдел внутренних дел по гор. Москва по району Камовники", Date.new(2019, 3, 1))
			elena = Client.new("Октябрьская", "Елена", "Ивановна",  Date.new(1999, 2, 18), passportData2, "40-летия победы д.58 кв.117")

			passportData3 = PassportData.new("1011", "999999", "Российская Федерация",  
				"ТП №75 отдела УФМС по гор. Москва по району Камовники", Date.new(2000, 9, 29))
			anna = Client.new("Цветкова", "Анна", "Витальевна",  Date.new(1980, 9, 9), passportData3, "Орджиникидзе д.114")

			clientsList << ivan << elena << anna	
		end
	end


	class TestLoan
		attr_reader :loansList

		def initialize
			@loansList = Array.new
		end

		def createLoans
			passportData1 = PassportData.new("0913", "667788", "Российская Федерация",  
				"Отделение УФМС России по гор. Москва по району Камовники", Date.new(2014, 8, 9))
			ivan = Client.new("Иванов", "Иван", "Иванович",  Date.new(1969, 7, 20), passportData1, "Красная д.14 кв.28")
			mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
			loan1 = Loan.new(ivan, Date.new(2021, 3, 13), Date.new(2021, 11, 4), mortgagedPropertyDict)

			passportData2 = PassportData.new("1315", "151411", "Российская Федерация",  
				"Отдел внутренних дел по гор. Москва по району Камовники", Date.new(2019, 3, 1))
			elena = Client.new("Октябрьская", "Елена", "Ивановна",  Date.new(1999, 2, 18), passportData2, "40-летия победы д.58 кв.117")
			loan2 = Loan.new(elena, Date.new(2021, 5, 24), Date.new(2021, 6, 24), {"Золотой кулон с бриллиантами" => 40000})

			passportData3 = PassportData.new("1011", "999999", "Российская Федерация",  
				"ТП №75 отдела УФМС по гор. Москва по району Камовники", Date.new(2000, 9, 29))
			anna = Client.new("Цветкова", "Анна", "Витальевна",  Date.new(1980, 9, 9), passportData3, "Орджиникидзе д.114")
			loan3 = Loan.new(anna, Date.new(2021, 4, 14), Date.new(2021, 4, 21), {"Наручные часы" => 15000})

			loansList << loan1 << loan2 << loan3	
		end
	end
end