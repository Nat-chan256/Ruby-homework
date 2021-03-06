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