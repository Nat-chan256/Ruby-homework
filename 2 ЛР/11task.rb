# 16

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
