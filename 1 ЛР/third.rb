print "Ваш любимый язык программирования: "
pl = STDIN.gets.chomp.downcase

case pl
	when "ruby"
		puts "Ну и подлиза же Вы, сударь :)"
	when "python"
		puts "Мэйнстрим :( Скоро перейдете на ruby"
	when "java"
		puts "Неплохо, но скоро её место займет ruby"
	when "c++"
		puts "Врете Вы все, Ваш любимый язык - ruby :)"
	else
		puts "Не знаю такого языка, но скоро в Вашем сердце его заменит ruby"

end

#Реализации условного оператора
print "Введите значение x: "
x = STDIN.gets.chomp.downcase.to_i
if x > 10
	puts "Слишком много, я таких чисел не знаю"
elsif x <= 10 and x > 5
	puts "В самый раз :)"
else
	puts "Слишком мало"
end