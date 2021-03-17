#Чтение содержимого файла
def readFromFile(filePath)
	if not File.file?(filePath) #Проверка существования файла
		return nil
	end
    file = File.new(filePath, "r:UTF-8")
    lines = file.readlines
	return lines.join(" ")
end

if ARGV.length < 1
	abort "Введите путь к файлу с входными данными в качестве аргумента программы"
end

str = readFromFile(ARGV[0])

months = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
result = Array.new
arr = str.split()

for i in 0..arr.length-3
	if arr[i].scan(/\D/).empty? and arr[i].to_i >= 1 and arr[i].to_i <= 31 and months.index(arr[i+1]) != nil and arr[i+2].scan(/\D/).empty?
		result.push("#{arr[i]} #{arr[i+1]} #{arr[i+2]}")
	end
end

puts result