module ListEmp
	require 'date'

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

		def sortByAddress!
			@empList.sort_by! {|emp| emp.address}
		end

		def sortByBirthDate!
			@empList.sort_by! {|emp| DateTime.parse(emp.birthDate)}
		end

		def sortByEmail!
			@empList.sort_by! {|emp| emp.email}
		end

		def sortByExperience!
			@empList.sort_by! {|emp| emp.experience}
		end

		def sortByName!
			@empList.sort_by! {|emp| emp.name}
		end

		def sortByPassportData!
			@empList.sort_by! {|emp| emp.passSeriesNumber}
		end

		def sortByPatronymic!
			@empList.sort_by! {|emp| emp.patronymic}
		end

		def sortByPhoneNumber!
			@empList.sort_by! {|emp| emp.phoneNumber}
		end

		def sortBySpeciality!
			@empList.sort_by! {|emp| emp.speciality}
		end

		def sortBySurname!
			@empList.sort_by! {|emp| emp.surname}
		end

	end
end