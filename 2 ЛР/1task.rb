def findMinElem(array)
    min = Float::INFINITY
    for i in array
        if (i < min)
			min = i
		end
    end
    return min
end

def findMaxElem(array)
    max = -Float::INFINITY
    for i in array
        if (i > max)
			max = i
		end
    end
    return max
end

def findElemsSum(array)
    sum = 0
    for i in array
        sum += i
    end
    return sum
end

def findElemsProd(array)
    prod = 1
    for i in array
        prod *= i
    end
    return prod
end

#Чтение списка с клавиатуры
puts "Введите элементы списка через пробел: "
input = STDIN.gets.chomp.strip.downcase
array = (input.split).map{|elem| elem.to_i}

puts "Минимальный элемент: #{findMinElem(array)}"
puts "Максимальный элемент: #{findMaxElem(array)}"
puts "Сумма элементов: #{findElemsSum(array)}"
puts "Произведение элементов: #{findElemsProd(array)}"

