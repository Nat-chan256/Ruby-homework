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
		
		def findEmployeeByFullName(surname, name, patronymic)
			if not Employee.isFullName("#{surname} #{name} #{patronymic}")
				raise "ФИО некорректно"
			end
			empList.select{|emp| emp.surname == surname and emp.name == name and emp.patronymic == patronymic}
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