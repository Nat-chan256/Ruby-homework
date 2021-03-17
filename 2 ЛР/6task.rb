#21, 33, 45, 57

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
