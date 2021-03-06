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

puts digitsProduct(1244).to_s