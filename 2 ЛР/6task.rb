#1.9
#Нахождение элементов, расположенных перед последним минимальным
def findElemsPreviousToLastMinimum(arr)
	result = Array.new
	min = arr[0]
	index = 0
	for i in 1..arr.length-1
		if arr[i] <= min
			min = arr[i]
			result += arr[index..i-1]
			index = i
		end
	end
	return result
end

#1.21
#Нахождение элементов после первого максимального
def findElemsAfterFirstMaximum(arr)
	result = Array.new
	max = arr[arr.length-1]
	index = arr.length-1
	for i in (1..arr.length-1).to_a.reverse
		if arr[i] >= max
			max = arr[i]
			result.insert(0, arr[i+1..index])
			index = i
		end
	end
	return result
end

#1.33
#Проверка, чередуются ли в массиве положительные и отрицательные числа
def doSignsAlternate(arr)
	for i in 0..arr.length-2
		if arr[i] * arr[i+1] > 0
			return false
		end
	end
	return true
end

#1.45
#Нахождение суммы элементов, значение которых лежит в интервале a..b
def sumOfElemsInInterval(arr, a, b)
	sum = 0
	for elem in arr
		if elem >= a and elem <= b
			sum += elem
		end
	end
	return sum
end

#1.57
#Нахождение элементов, больших, чем сумма всех предыдущих элементов
def elemsBiggerThanSumOfPreviousOnes(arr)
	result = Array.new
	sum = 0
	for elem in arr
		if elem > sum
			result.push(elem)
		end
		sum += elem
	end
	return result
end

def readArrayFromFile(filePath)
	if not File.file?(filePath) #Проверка существования файла
		return Array.new 
	end
    file = File.new(filePath, "r:UTF-8")
    lines = file.readlines
	arr = Array.new
	lines.each {|line| arr += (line.split()).map{|num| num.to_i}}
	return arr
end

programUsageMessage = "Использование программы: 1. ruby 5task.rb file <filepath> для чтения списка из файла, где <filepath> - путь к файлу, хранящему список
2. ruby 5task.rb keyboard для ввода списка с клавиатуры"

if ARGV.length == 0
	abort programUsageMessage
end

#Чтение массива
arr = Array.new
case ARGV[0]
	when "file"
		abort "Передайте путь к файлу в качестве второго параметра программы" if ARGV.length < 2
		arr = readArrayFromFile(ARGV[1])
	when "keyboard"
		#Чтение списка с клавиатуры
		puts "Введите элементы списка через пробел: "
		input = STDIN.gets.chomp.strip.downcase
		arr = (input.split).map{|elem| elem.to_i}
	else
		puts programUsageMessage
end

answer = "1"
while answer != "0"
	puts "Введите номер задачи из списка (или 0 - для выхода):
	9 - Нахождение элементов, расположенных перед последним минимальным
	21 - Нахождение элементов после первого максимального
	33 - Проверка, чередуются ли в массиве положительные и отрицательные числа
	45 - Нахождение суммы элементов, значение которых лежит в интервале a..b
	57 - Нахождение элементов, больших, чем сумма всех предыдущих элементов"
	answer = STDIN.gets.chomp.strip
	case answer
		when "9"
			puts(findElemsPreviousToLastMinimum(arr))
		
		when "21"
			puts(findElemsAfterFirstMaximum(arr))
			
		when "33"
			puts(doSignsAlternate(arr))
			
		when "45"
			print "Введите а = "
			a = STDIN.gets.chomp.strip.to_i
			print "Введите b = "
			b = STDIN.gets.chomp.strip.to_i
			puts(sumOfElemsInInterval(arr, a, b))
		when "57"
			puts(elemsBiggerThanSumOfPreviousOnes(arr))
		
	end
end