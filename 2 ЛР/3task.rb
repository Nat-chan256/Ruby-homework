def readArray(length)
	puts "Введите #{length} элементов массива. Каждый элемент на отдельной строке"
    arr = Array.new(length)

    for i in 1 .. length
        print "#{i}: "
        arr << STDIN.gets.chomp.strip.downcase.to_i
    end

    return arr
end


#Чтение массива с клавиатуры

abort "Укажите количество аргументов массива в качестве аргумента программы" if ARGV.length == 0

abort "Аргументом программы должно быть число" if not ARGV[0].scan(/\D/).empty?
arr = readArray(ARGV[0].to_i)


#Добавление элемента в массива

puts "\n1. += "
print "Было: "
arr.each {|elem| print "#{elem} "}
arr += [-1]
print "\nСтало: " 
arr.each {|elem| print "#{elem} "}