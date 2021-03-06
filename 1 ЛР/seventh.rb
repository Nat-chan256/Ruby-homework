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
