#3
#Перемешивание слов в строке в случайном порядке
def shuffleWords(str)
	return str.split().shuffle().join(" ")
end

#8
#Количество слов в строке, состоящиз из четного количества символов
def countWordsOfEvenCharsNum(str)
	return str.split().select{|word| word.length % 2 == 0}.count
end

#16
