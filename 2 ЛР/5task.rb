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

case ARGV[0]
	when "file"
		abort "Передайте путь к файлу в качестве второго параметра программы" if ARGV.length < 2
		arr = readArrayFromFile(ARGV[1])

		puts "Массив из файла: #{arr}"
	when "keyboard"
		#Чтение списка с клавиатуры
		puts "Введите элементы списка через пробел: "
		input = STDIN.gets.chomp.strip.downcase
		array = (input.split).map{|elem| elem.to_i}
		
		puts "Введенный массив #{array}"
	else
		puts programUsageMessage
end