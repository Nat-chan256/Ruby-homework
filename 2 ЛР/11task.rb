#8, 16

#3
#Нахождение количества русских символов
def countCyrillics(str)
	return str.scan(/[а-яА-Я]/).count
end
