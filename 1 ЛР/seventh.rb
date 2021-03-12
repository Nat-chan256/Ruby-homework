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

def isPrime(num)
	result = true
	for i in (2..(num/2)) do
		if num % i == 0
			result = false
		end
	end
	
	result
end

def digitsNotDivisibleBy5Product(num)
	prod = 1
	num.digits.map{ |digit| prod *= digit if digit % 5 != 0 }
	prod
end

def maxPrimeDelimeter(num)
	maxDel = num
	for i in (1..num).to_a.reverse do
		if num % i == 0 and isPrime(i)
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


def digitsProduct(num)
	prod = 1
	num.digits.map{ |digit| prod *= digit if digit != 0}
	prod
end

def maxOddNotPrimeDelimeter(num)
	del = 1
	for i in (1..num).to_a.reverse do
		if i.odd? and not isPrime(i) and num % i == 0
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

if ARGV.length == 0
	puts "Hello world"
elsif ARGV.length == 1
	puts "Не хватает аргумента"
else
	case ARGV[0]
		when "1"
			puts "Сумма цифр: " + digitsSum(ARGV[1].to_i).to_s
			
		when "2"
			puts "Максимальная цифра: " + maxDigit(ARGV[1].to_i).to_s
			
		when "3"
			puts "Минимальная цифра: " + minDigit(ARGV[1].to_i).to_s
		
		when "4"
			puts "Произведение цифр: " + digitsProduct(ARGV[1].to_i).to_s
		
		when "5"
			puts "Максимальный простой делитель: " + maxPrimeDelimeter(ARGV[1].to_i).to_s
		
		when "6"
			puts "Произведение цифр числа, не делящихся на 5: " + digitsNotDivisibleBy5Product(ARGV[1].to_i).to_s
		
		when "7"
			puts "НОД максимального нечетного непростого делителя
числа и прозведения цифр данного числа: " + maxOddNotPrimeDelAndDigitsProdGCF(ARGV[1].to_i).to_s

		else
			puts "Номер метода некорректен"

	end
		
		
end
	