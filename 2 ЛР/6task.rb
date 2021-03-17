#33, 45, 57

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