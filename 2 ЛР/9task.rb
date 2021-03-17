#3
#Перемешивание слов в строке в случайном порядке
def shuffleWords(str)
	return str.split().shuffle().join(" ")
end

#8
#Количество слов в строке, состоящих из четного количества символов
def countWordsOfEvenCharsNum(str)
	return str.split().select{|word| word.length.even?}.count
end

#16
#Дан массив в котором находятся строки "белый", "синий" и "красный" в случайном порядке. Необходимо упорядочить массив так, чтобы получился российский флаг.
def sortTricolor(arr)
	sampleArr = ["белый", "синий", "красный"]
	return arr.sort_by{|element| sampleArr.index(element.downcase)}
end


#Чтение строки из файла
def readFromFile(filePath)
	if not File.file?(filePath) #Проверка существования файла
		return nil
	end
    file = File.new(filePath, "r:UTF-8")
    lines = file.readlines
	return lines.join(" ")
end

answer = "1"
while answer != "0"
	puts "Введите номер задачи из списка:
	0 - выход из программы
	1 - перемешивание слов в строке
	2 - подсчет количества слов, состоящих из четного количеств символов
	3 - сортировка массива, состоящего из слов 'белый', 'красный' и 'синий' в порядке цветов российского флага"
	answer = STDIN.gets.chomp.strip
	case answer
		when "1"
			print "Введите исходную строку: "
			str = STDIN.gets.chomp
			puts "Результат перемешивания: #{shuffleWords(str)}"
			
		when "2"
			print "Введите исходную строку: "
			str = STDIN.gets.chomp
			puts "Количество слов, состоящих из четного числа символов: #{countWordsOfEvenCharsNum(str)}"
			
		when "3"
			print "Введите путь к файлу с массивом: "
			filePath = STDIN.gets.chomp
			puts "Результат сортировки #{sortTricolor(readFromFile(filePath).split())}"
		
	end
end