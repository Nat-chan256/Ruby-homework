def readArray(length)
	puts "Введите #{length} элементов массива. Каждый элемент на отдельной строке"
    arr = Array.new(length)

    for i in 0 .. length-1
        print "#{i+1}: "
        arr[i] = STDIN.gets.chomp.strip.downcase.to_i
    end

    return arr
end


#Чтение массива с клавиатуры

abort "Укажите количество аргументов массива в качестве аргумента программы" if ARGV.length == 0

abort "Аргументом программы должно быть число" if not ARGV[0].scan(/\D/).empty?
arr = readArray(ARGV[0].to_i)


#Добавление элемента в массива

puts "\n1. += "
puts "Было: #{arr}"
arr += [-1]
puts "Стало: #{arr}" 


puts "\n2. unshift "
puts "Было: #{arr}"
arr.unshift(-2)
puts "Стало: #{arr}" 

