require_relative "TerminalViewListEmployee"
require_relative "Employee"
require_relative "TestEmployee"

include TerminalView
include Emp
include TestEmp

#Конвертирует ФИО в массив, где элементы - это фамилия, имя и отчество
def convertFullNameToArray(fullName)
	arr = fullName.split
	name = arr[0]
	surname = arr[1]
	patronymic = (arr.length == 3)? arr[2] : "#{arr[2]} #{arr[3]}"
	return name, surname, patronymic
end


# Для адекватной работы с кириллицей в консоли
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

testEmp = TestEmployee.new
terminalView = TerminalViewListEmployee.new

answer = "y"

while answer != "n"

	#Ввод ФИО
	fullName = String.new
	result = nil
	while result == nil
		print "Введите ФИО сотрудника: "
		fullName = STDIN.gets.chomp
		result = testEmp.testFullName(fullName)
		if result == nil
			puts "Некорректный ввод ФИО"
		end
	end
	
	#Ввод даты рождения
	birthDate = String.new
	result = nil
	while result == nil
		print "Введите дату рождения сотрудника: "
		birthDate = STDIN.gets.chomp
		result = testEmp.testDate(birthDate)
		if result == nil
			puts "Некорректный ввод даты"
		end
	end
	
	#Ввод номера телефона
	phoneNumber = String.new
	result = nil
	while result == nil
		print "Введите номер телефона сотрудника: "
		phoneNumber = STDIN.gets.chomp
		result = testEmp.testPhoneNumber(phoneNumber)
		if result == nil
			puts "Некорректный ввод номера"
		end
	end
	
	#Ввод адреса
	print "Введите адрес сотрудника: "
	address = STDIN.gets.chomp
	
	#Ввод email
	email = String.new
	result = nil
	while result == nil
		print "Введите email сотрудника: "
		email = STDIN.gets.chomp
		result = testEmp.testEmail(email)
		if result == nil
			puts "Некорректный ввод email"
		end
	end
	
	#Ввод паспортных данных
	passportData = String.new
	result = nil
	while result == nil
		print "Введите серию и номер паспорта сотрудника через пробел: "
		passportData = STDIN.gets.chomp
		result = testEmp.testPassportData(passportData)
		if result == nil
			puts "Некорректный ввод паспортных данных"
		end
	end
	
	#Ввод специальности
	print "Введите специальность сотрудника: "
	speciality = STDIN.gets.chomp
	
	#Ввод стажа работы
	exprienceStr = "s"
	experience = 0
	while not exprienceStr.scan(/\D/).empty?
		print "Введите стаж работы по специальности (количество лет): "
		exprienceStr = STDIN.gets.chomp
		if not exprienceStr.scan(/\D/).empty?
			puts "Вводимое значение должно быть числом"
		else
			experience = exprienceStr.to_i
		end
	end
	
	if experience == 0
		name, surname, patronymic = convertFullNameToArray(fullName)
		employee = Employee.new(name, surname, patronymic, birthDate, phoneNumber, email, address, passportData, speciality)
		terminalView.addEmployee(employee)
	else
		#Ввод названия предыдущего места работы
		print "Введите название предыдущего места работы: "
		prevWorkName = STDIN.gets.chomp
		
		#Ввод должности на пред. месте работы
		print "Введите название должности на предыдущем месте работы: "
		prevWorkSpeciality = STDIN.gets.chomp
		
		#Ввод зар.платы на пред. месте работы
		salaryStr = "s"
		salary = 0
		while not salaryStr.scan(/\D/).empty?
			print "Введите размер зар.платы на предыдущем месте работы: "
			salaryStr = STDIN.gets.chomp
			if not salaryStr.scan(/\D/).empty?
				puts "Вводимое значение должно быть числом"
			else
				salary = salaryStr.to_i
			end
		end
		
		name, surname, patronymic = convertFullNameToArray(fullName)
		employee = Employee.new(name, surname, patronymic, birthDate, phoneNumber, email, address, passportData, speciality, experience, prevWorkName, prevWorkSpeciality, salary)
		terminalView.addEmployee(employee)
	end

	print "Продолжить ввод сотрудников?(y/n): "
	answer = STDIN.gets.chomp.strip
end

puts "Добавленные сотрудники:"
terminalView.showEmployeesData