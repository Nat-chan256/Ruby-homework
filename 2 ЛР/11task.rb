#Метод из предыдущего задания
def findDates(str)
	months = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
	result = Array.new
	arr = str.split()

	for i in 0..arr.length-3
		if arr[i].scan(/\D/).empty? and arr[i].to_i >= 1 and arr[i].to_i <= 31 and months.index(arr[i+1]) != nil and arr[i+2].scan(/\D/).empty?
			result.push("#{arr[i]} #{arr[i+1]} #{arr[i+2]}")
		end
	end

	return result
end

#3
#Нахождение количества русских символов
def countCyrillics(str)
	return str.scan(/[а-яА-Я]/).count
end

#8
#Нахождение всех используемых строчных символов латиницы
def findLowercaseLatin(str)
	return str.scan(/[a-z]/).uniq
end

#16
#Нахождение минимального из имеющихся в строке целых чисел.
def findMinInteger(str)
	return str.scan(/-*\d+/).map {|num| num.to_i}.min
end




# Для адекватной работы с кириллицей в консоли
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

answer = "1"
while answer != "0"
	puts "\nВведите номер пункта:
	0. Выход 
	1. Нахождение дат в виде '31 февраля 2007'
	2. Нахождение количества русских символов
	3. Нахождение всех используемых строчных символов латиницы
	4. Нахождение минимального из имеющихся в строке целых чисел"
	
	answer = STDIN.gets.chomp.strip
	
	case answer
		when "1"
			print "Введите входную строку: "
			str = STDIN.gets.chomp.strip
			puts findDates(str)
			
		when "2"
			print "Введите входную строку: "
			str = STDIN.gets.chomp.strip
			puts countCyrillics(str).to_s
			
		when "3"
			print "Введите входную строку: "
			str = STDIN.gets.chomp.strip
			puts findLowercaseLatin(str)
			
		when "4"
			print "Введите входную строку: "
			str = STDIN.gets.chomp.strip
			puts findMinInteger(str)
	end
end