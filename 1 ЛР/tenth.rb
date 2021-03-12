def task19()
	curDayWeek = 365 % 7 #День недели 1 янв 1901

	numOfSundaysInJans = 0;

	for curYear in 1901..2000
		if (curYear % 4 == 0)
			curDayWeek = (curDayWeek + 366) % 7
		else
			curDayWeek = (curDayWeek + 365) % 7
		end
		
		if (curDayWeek >= 4)
			numOfSundaysInJans += 5
		else
			numOfSundaysInJans += 4
		end
	end

	puts "Количество воскресений, выпадавших на январи 20-го века: #{numOfSundaysInJans}"
end

def task39()
	maxSolutions = 0
	perimeter = 0
	p = 2
	
	while p <= 1000 do
		solutionsNum = 0
		for a in 2..p/3
			if (p*(p-2*a) % (2*(p-a)) == 0)
				solutionsNum += 1  
			end
		end
				
		if (solutionsNum > maxSolutions)
			maxSolutions = solutionsNum
			perimeter = p
		end
	
		p += 2
	end
	
	return perimeter, maxSolutions
	
end

task19()

p, s = task39()

puts "\nДля p = #{p} количество возможных решений: #{s} - максимальное значение для p <= 1000"