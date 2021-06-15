#Частота встречаемости символа в алфавите
$frequencyInAlphabet = {
	'о' => 0.10983,
	'е' => 0.08483, 
	'а' => 0.07998, 
	'и' => 0.07367, 
	'н' => 0.067, 
	'т' => 0.06318, 
	'с' => 0.05473, 
	'р' => 0.04746, 
	'в' => 0.04533, 
	'л' => 0.04343, 
	'к' => 0.03486, 
	'м' => 0.03203, 
	'д' => 0.02977, 
	'п' => 0.02804, 
	'у' => 0.02615, 
	'я' => 0.02001, 
	'ы' => 0.01898, 
	'ь' => 0.01735, 
	'г' => 0.01687, 
	'з' => 0.01641, 
	'б' => 0.01592, 
	'ч' => 0.0145, 
	'й' => 0.01208, 
	'х' => 0.00966, 
	'ж' => 0.0094, 
	'ш' => 0.00718, 
	'ю' => 0.00639, 
	'ц' => 0.00486, 
	'щ' => 0.00361, 
	'э' => 0.00331, 
	'ф' => 0.00267, 
	'ъ' => 0.00037, 
	'ё' => 0.00013,
	
	'e' => 0.1116,
	'a' => 0.08496,
	'r' => 0.0758,
	'i' => 0.07544,
	'o' => 0.07163,
	't' => 0.0695,
	'n' => 0.06654,
	's' => 0.05735,
	'l' => 0.05489,
	'c' => 0.04538,
	'u' => 0.0363,
	'd' => 0.03384,
	'p' => 0.03167,
	'm' => 0.03012,
	'h' => 0.03003,
	'g' => 0.0247,
	'b' => 0.02072,
	'f' => 0.01812,
	'y' => 0.01777,
	'w' => 0.01289,
	'k' => 0.01101,
	'v' => 0.01007,
	'x' => 0.0029,
	'z' => 0.00272,
	'j' => 0.001965,
	'q' => 0.001962
}


#Нахождение максимального среднего веса ASCII-кода каждой тройки символов в строке
def avgMaxWeighsOfTriplesASCIICode(line)
	return line.scan(/.../).map {|triple| findMaxAvgWeighOfASCIICode(triple)}
end


#Нахождение дисперсии
def dispersion(values)
	return expectedValue(values.map {|value| value**2}) - expectedValue(values)**2
end


#Нахождение математического ожидания величины
def expectedValue(values)
	p = Hash.new #Вероятности для каждого значения values
	uniqValues = values.uniq
	uniqValues.each {|value| p[value] = values.count(value) / values.length.to_f}
	return uniqValues.map {|value| value * p[value]}.sum
end


# Нахождение среднего веса ASCII кодов группы символов chairs
# chars - строка символов 
def findMaxAvgWeighOfASCIICode(chars)
	return chars.each_char.map {|char| char.bytes[0].to_s(2).count("1")}.sum / chars.length
end


#Нахождение наиболее часто встречающегося символа в строке
def mostOftenSymbol(line)
	frequencies = Hash.new
	
	line.each_char do
		|char| 
		if frequencies.include?(char) then frequencies[char] += 1
		else frequencies[char] = 1
		end
	end
	
	return frequencies.invert[frequencies.invert.keys.max]
end

#Чтение содержимого файла
def readFromFile(filePath)
	if not File.file?(filePath) #Проверка существования файла
		return nil
	end
    file = File.new(filePath, "r:UTF-8")
	return file.readlines
end

#Квадратичное отклонение
def standartDeviation(val1, val2)
	return Math.sqrt((val1 - val2)**2) 
end


#Квадратичное отклонение, но теперь второй аргумент - массив
def standartDeviationForArray(val, arr)
	return Math.sqrt(  arr.map {|elem| (elem - val)**2}.sum  / arr.length )
end

#Нахождение частоты встречаемости символа в строке
def symbolFrequency(symbol, line)
	return line.count(symbol) / line.length.to_f
end


# Сортировка по длине строк
# lines - массив строк
def sortByLength(lines)
	return lines.sort_by {|line| line.length}
end

# Сортировка по количеству слов в строке
# lines - массив строк
def sortByWordsNum(lines)
	return lines.sort_by {|line| line.split.count}
end


# Сортировка по количеству слов, стоящих после чисел
# lines - массив строк
def sortByWordsAfterNums(lines)
	lines.sort_by {|line| line.split.select {|w1, w2| not w1.scan(/^\d+$/).empty?}.count}
end

#3
# Отсортировать строки
# В порядке увеличения разницы между частотой наиболее часто встречаемого символа в строке и частотой его появления в алфавите
# lines - массив строк
def sortByDiffBetweenFrequencies(lines)
	return lines.sort_by do
	|line| 
	lowerLine = line.downcase
	(symbolFrequency(mostOftenSymbol(lowerLine), lowerLine) - $frequencyInAlphabet[mostOftenSymbol(lowerLine)]).abs
	end
end


#5
# Отсортировать строки
# В порядке увеличения квадратичного отклонения частоты встречаемости самого часто встречаемого в строке символа от частоты его встречаемости в текстах на этом алфавите
# lines - массив строк
def sortByStandartDeviation(lines)
	return lines.sort_by do
	|line| 
	lowerLine = line.downcase
	standartDeviation(symbolFrequency(mostOftenSymbol(lowerLine), lowerLine), $frequencyInAlphabet[mostOftenSymbol(lowerLine)])
	end
end


#9
# Отсортировать строки
# В порядке увеличения квадратичного отклонения между наибольшим ASCII-кодом символа строки и разницы в ASCII-кодах пар зеркально расположенных символов строки (относительно ее середины)
# lines - массив строк
def sortByASCIICodesStandartDeviation(lines)
	return lines.sort_by {|line| standartDeviationForArray( line.bytes.max ,  line[0..(line.length/2-1)].each_char.map.with_index {|char, i| (char.bytes[0] - line[line.length - i - 1].bytes[0])} )}
end


#11
# Отсортировать строки
# В порядке увеличения квадратичного отклонения дисперсии максимального среднего веса ASCII-кода тройки символов в строке от максимального сред-него веса ASCII-кода тройки символов в
# первой строке
# lines - массив строк
def sortByDispertionStandartDeviation(lines)
	return lines.sort_by {|line| standartDeviation( dispersion(avgMaxWeighsOfTriplesASCIICode(line)) , avgMaxWeighsOfTriplesASCIICode(lines[0]).max  )}
end

if ARGV.length < 1
	abort "Введите путь ко входному файлу в качестве аргумента программы"
end

lines = readFromFile(ARGV[0])

answer = "1"

while answer != "0"
	puts "\n\nВведите номер пункта:
0. Выход
1. Сортировка по длине строки
2. Сортировка по количеству слов строке
3. Сортировка по количеству слов, идущих после чисел
4. Сортировка в порядке увеличения разницы между частотой наиболее часто встречаемого символа в строке и частотой его появления в алфавите
5. Сортировка в порядке увеличения квадратичного отклонения частоты встречаемости самого часто встречаемого в строке символа от частоты его встречаемости в текстах на этом алфавите
6. Сортировка в порядке увеличения квадратичного отклонения между наибольшим ASCII-кодом символа строки и разницы в ASCII-кодах пар зеркально расположенных символов строки (относительно ее середины)
7. Сортировка в порядке увеличения квадратичного отклонения дисперсии максимального среднего веса ASCII-кода тройки символов в строке от максимального сред-него веса ASCII-кода тройки символов в первой строке"

	answer = STDIN.gets.chomp.strip

	case answer
	
		when "1"
			puts sortByLength(lines)
			
		when "2"
			puts sortByWordsNum(lines)
	
		when "3"
			puts sortByWordsAfterNums(lines)
	
		when "4"
			puts sortByDiffBetweenFrequencies(lines)
	
		when "5"
			puts sortByStandartDeviation(lines)
	
		when "6"
			puts sortByASCIICodesStandartDeviation(lines)
			
		when "7"
			puts sortByDispertionStandartDeviation(lines)
	
	
	end
end
