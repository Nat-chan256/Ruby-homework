def findMinElem(array)
    return array.min
end

def findMaxElem(array)
    array.max
end

def findElemsSum(array)
    array.reduce(:+)
end

def findElemsProd(array)
    array.inject(1) {|prod, elem| prod * elem }
end

#Чтение списка с клавиатуры
puts "Введите элементы списка через пробел: "
input = STDIN.gets.chomp.strip.downcase
array = (input.split).map{|elem| elem.to_i}

puts "Минимальный элемент: #{findMinElem(array)}"
puts "Максимальный элемент: #{findMaxElem(array)}"
puts "Сумма элементов: #{findElemsSum(array)}"
puts "Произведение элементов: #{findElemsProd(array)}"

