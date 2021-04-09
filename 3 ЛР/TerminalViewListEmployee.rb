module TerminalView

require_relative "Employee"
require_relative "Crypt"

include Emp
include Crypt

class TerminalViewListEmployee
	def initialize
		@empsList = Array.new
	end
	
	def addEmployee(employee)
		@empsList.push(employee)
	end
	
	def showEmployeesData()
		counter = 1
		for emp in @empsList
			puts "\n\nСотрудник №#{counter}:"
			puts emp
			counter += 1
		end
	end

	#Записывает данные обо всех сотрудниках, причем паспортные данные шифруются
	def writeEmployeesToFile(filePath)
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