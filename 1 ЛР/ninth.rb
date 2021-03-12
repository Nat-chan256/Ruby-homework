require 'prime'

def digitsSum(num)
    sum = 0
	num.digits.map{ |digit| sum += digit }
	sum
end

def maxDigit(num)
    num.digits.max
end

def minDigit(num)
    num.digits.min
end

def digitsProduct(num)
	prod = 1
	num.digits.map{ |digit| prod *= digit }
	prod
end

def digitsNotDivisibleBy5Product(num)
	prod = 1
	num.digits.map{ |digit| prod *= digit if digit % 5 != 0 }
	prod
end

def maxPrimeDelimeter(num)
	maxDel = num
	for i in (1..num).to_a.reverse do
		if num % i == 0 and Prime.prime?(i)
			maxDel = i
			break
		end
	end
	maxDel
end

def GCF(num1, num2)
	while num1 != num2
		if num1 > num2
			num1 -= num2
		else
			num2 -= num1
		end
	end
	
	num1
end

def maxOddNotPrimeDelimeter(num)
	del = 1
	for i in (1..num).to_a.reverse do
		if i.odd? and not Prime.prime?(i) and num % i == 0
			del = i
			break
		end
	end
	del
end

def maxOddNotPrimeDelAndDigitsProdGCF(num)
	maxDel = maxOddNotPrimeDelimeter(num)
	digProd = digitsProduct(num)
	gcf = GCF(maxDel, digProd)
end


#Справка

if ARGV[0] == "-h"
    abort "Формат вызова программы: ruby eighth.rb <параметр> <номер_функции1> <номер_функции2> ... <номер_функцииN>
	
где <параметр> - число, подаваемое на вход функциям с номерами <номер_функции1> <номер_функции2> ... <номер_функцииN>
<номер_функцииN> - число из диапазона [1;7], которому соответствует одна из функций.
	
Список функций и их номеров:
1 - Сумма цифр числа
2 - Максимальная цифра числа
3 - Минимальная цифра числа
4 - Произведение цифр числа
5 - Максимальный простой делитель числа
6 - Произведение цифр числа, не делящихся на 5
7 - НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа"
end

#Проверка корректности введенных параметров

if ARGV.length < 2
	abort "Некорректно введены параметры. См. ruby eighth.rb -h для справки."
end

ARGV.each do
    |arg|
    if not arg.scan(/\D/).empty? #Если параметры содержат что-то кроме цифр
		abort "Некорректно введены параметры. См. ruby eighth.rb -h для справки."
	end
end

#Выполнение функций

arg = ARGV[0].to_i
ARGV[1..-1].each do
	|funcNum|
	
	case funcNum
		when "1"
			puts "Сумма цифр числа: #{digitsSum(arg)}"
		when "2"
			puts "Максимальная цифра числа: #{maxDigit(arg)}"
		when "3"
			puts "Минимальная цифра числа: #{minDigit(arg)}"
		when "4"
			puts "Произведение цифр числа: #{digitsProduct(arg)}"
		when "5"
			puts "Максимальный простой делитель числа: #{maxPrimeDelimeter(arg)}"
		when "6"
			puts "Произведение цифр числа, не делящихся на 5: #{digitsNotDivisibleBy5Product(arg)}"
		when "7"
			puts "НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа: #{maxOddNotPrimeDelAndDigitsProdGCF(arg)}"
		else
			puts "Некорретный номер функции: #{funcNum}. Номер функции должен лежать в диапазоне [1..7]"
	end
end