module TerminalView

require 'openssl'
require 'base64'

require_relative "Employee"
require_relative "Crypt"

include Emp
include Crypt

class TerminalViewListEmployee

	def initialize
		@empsList = Array.new
		@public_key_file = "Employees.pem"
	end
	
	def addEmployee(employee)
		@empsList.push(employee)
	end
	
	
	#Вспомогательный метод, разбивающий текст на фрагменты, ориентируясь на разделитель
	def divideBySeparatorLine(text)
		return text.split(/\n=+\n/)
	end
	
	def readEmployeesFromFile(filePath)
		if not File.file?(filePath) #Проверка существования файла
			return Array.new 
		end
		
		file = File.new(filePath, "r:UTF-8")
		return divideBySeparatorLine(file.read).map {|empData| Employee.createEmployeeFromData(empData)}
	end
	
	def showEmployeesData()
		counter = 1
		for emp in @empsList
			puts "\n\nСотрудник №#{counter}:"
			puts emp
			counter += 1
		end
	end

	def writeEmployeesToFile(filePath)
		file = File.new(filePath, "w:UTF-8")
		@empsList.each  do
			|emp|
			crypt = Cryptographer.new
			empData = emp.to_s
			file.write(empData + "\n")
			file.write("========================================\n")
		end
	end

	#Записывает данные обо всех сотрудниках, причем паспортные данные шифруются
	def writeEmployeesToFileWithEcnryption(filePath)
		file = File.new(filePath, "w:UTF-8")
		@empsList.each  do
			|emp|
			crypt = Cryptographer.new

			empData = emp.to_s
			empData.gsub!(/\d{4}\s\d{6}/, crypt.encrypt(empData.scan(/\d{4}\s\d{6}/)[0]).chomp)

			file.write(empData + "\n")
			file.write("========================================\n")
		end

	end
	
	
end

end