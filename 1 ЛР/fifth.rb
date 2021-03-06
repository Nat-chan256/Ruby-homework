if ARGV.length != 1
	puts "Введите число в качестве аргумента"
else
	sum = 0
	ARGV[0].to_i.digits.map{ |digit| sum += digit }
	puts "Сумма цифр равняется #{sum}"
end