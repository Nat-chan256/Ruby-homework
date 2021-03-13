def readArray(filePath)
	if not File.file?(filePath) #Проверка существования файла
		return Array.New 
	end
    file = File.new(filePath, "r:UTF-8")
    lines = file.readlines
	arr = Array.new
	lines.each {|line| arr += (line.split()).map{|num| num.to_i}}
	return arr
end

if ARGV.length < 1
    abort "Передайте путь к файле в качестве параметра программы"
end

arr = readArray(ARGV[0])

puts "Массив из файла: #{arr}"