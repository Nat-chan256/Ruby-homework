#3
#Нахождение количества русских символов
def countCyrillics(str)
	return str.scan(/[а-яА-Я]/).count
end

#8
#Нахождение всех используемых строчных символов латиницы
def findLowercaseLatin(str)
	return str.scan(/[a-z]/).uniq
end

#16
#Дана строка. Необходимо найти минимальное из имеющихся в ней целых чисел.
def findMinInteger(str)
	return str.scan(/-*\d+/).map {|num| num.to_i}.min
end
