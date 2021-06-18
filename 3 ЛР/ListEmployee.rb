module ListEmp
	require_relative "Employee"

	include Emp

	class ListEmployee
		attr_reader :empList

		def initialize
			@empList = Array.new
		end
		
		def addEmployee(emp)
			self.empList << emp
		end
		
		def showEmployees
			i = 1
			empList.each do 
				|emp| 
				puts "\n\nСотрудник №#{i}\n#{emp}"
				i += 1
			end
		end
	end
end