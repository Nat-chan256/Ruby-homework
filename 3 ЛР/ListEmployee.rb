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
		
		def findEmployeeByEmail(email)
			if not Employee.isEmail(email)
				raise "Email некорректен"
			end
			email = Employee.normalizeEmail(email)
			empList.select{|emp| emp.email == email}
		end
		
		def findEmployeeByFullName(surname, name, patronymic)
			fullName = "#{surname} #{name} #{patronymic}"
			if not Employee.isFullName(fullName)
				raise "ФИО некорректно"
			end
			fullName = Employee.normalizeFullName(fullName)

			empList.select{|emp| emp.fullName == fullName}
		end

		def findEmployeeByPassportData(passportSeries, passportNumber)
			passportData = "#{passportSeries} #{passportNumber}"
			if not Employee.isPassportData(passportData)
				raise "Паспортные данные некорректны"
			end
			passportData = Employee.normalizePassportData(passportData)

			empList.select{|emp| emp.passSeriesNumber == passportData}
		end

		def findEmployeeByPhoneNumber(phoneNumber)
			if not Employee.isRusPhoneNum(phoneNumber)
				raise "Номер телефона некорректен"
			end
			phoneNumber = Employee.normalizePhoneNumber(phoneNumber)

			empList.select{|emp| emp.phoneNumber == phoneNumber}
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