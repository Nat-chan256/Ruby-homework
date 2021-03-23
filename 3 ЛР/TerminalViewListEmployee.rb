module TerminalView

require_relative "Employee"
include Emp

class TerminalViewListEmployee
	def initialize
		@empsList = Array.new
	end
	
	def addEmployee(employee)
		@empsList.push(employee)
	end
	
	def showEmployeesData
		counter = 1
		for emp in @empsList
			puts "\n\nСотрудник №#{counter}:"
			puts emp
			counter += 1
		end
	end
end

end