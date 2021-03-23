require_relative "7task"

include Emp

class TestEmployee
	
	def initialize
		@emp = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
	end
	
	def testDate(value)
		begin
			@emp.birthDate = value
			puts "#{@emp.birthDate}"
		rescue
			puts "Некорректно введена дата"
		end
	end
	
	def testEmail(value)
		begin
			@emp.email = value
			puts "#{@emp.email}"
		rescue
			puts "Некорректно введен email"
		end
	end
	
	def testFullName(value)
		begin
			@emp.fullName = value
			puts "#{@emp.name} #{@emp.surname} #{@emp.patronymic}"
		rescue
			puts "Некорректно введено ФИО"
		end
	end
	
	def testPhoneNumber(value)
		begin
			@emp.phoneNumber = value
			puts "#{@emp.phoneNumber}"
		rescue
			puts "Некорректно введен номер телефона"
		end
	end
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
answer = "1"

while answer != "0"
	puts "Введите номер пункта:
	0. Выход
	1. Ввести ФИО
	2. Ввести телефон
	3. Ввести дату
	4. Ввести email"
	
	answer = STDIN.gets.chomp.strip
	
	case answer
		when "1"
			print "Введите ФИО: "
			fullName = STDIN.gets.chomp
			testEmp.testFullName(fullName)
			
		when "2"
			print "Введите номер телефона: "
			phoneNum = STDIN.gets.chomp
			testEmp.testPhoneNumber(phoneNum)
			
		when "3"
			print "Введите дату: "
			date = STDIN.gets.chomp
			testEmp.testDate(date)
			
		when "4"
			print "Введите email: "
			email = STDIN.gets.chomp
			testEmp.testEmail(email)
			
	end
end