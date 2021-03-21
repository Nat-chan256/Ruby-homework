#5, 9 11

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

#Нахождение частоты встречаемости символа в строке
def symbolFrequency(symbol, line)
	return line.count(symbol) / line.length.to_f
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




if ARGV.length < 1
	abort "Введите путь ко входному файлу в качестве аргумента программы"
end

lines = readFromFile(ARGV[0])

puts(sortByDiffBetweenFrequencies(lines))
