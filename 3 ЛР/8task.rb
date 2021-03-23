require_relative 'TestEmployee'
include TestEmp

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
			result = testEmp.testFullName(fullName)
			if result != nil
				puts result
			else
				puts "Некорректно введено ФИО"
			end
			
		when "2"
			print "Введите номер телефона: "
			phoneNum = STDIN.gets.chomp
			result = testEmp.testPhoneNumber(phoneNum)
			if result != nil
				puts result
			else
				puts "Некорректно введен номер телефона"
			end
			
		when "3"
			print "Введите дату: "
			date = STDIN.gets.chomp
			result = testEmp.testDate(date)
			if result != nil
				puts result
			else
				puts "Некорректно введена дата"
			end
			
		when "4"
			print "Введите email: "
			email = STDIN.gets.chomp
			result = testEmp.testEmail(email)
			if result != nil
				puts result
			else
				puts "Некорректно введен email"
			end
	end
end