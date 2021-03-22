class Employee

    attr_accessor :surname, :name, :patronymic,
        :address, :passSeriesNumber, :speciality,
        :experience
	
	attr_reader :phoneNumber, :email, :birthDate
	
	 def initialize(*args)
		if not (args.length == 9 or args.length == 13)
			raise "Количество аргументов должно быть равно 9 или 13"
		end
	  
	    self.fullName = "#{args[0]} #{args[1]} #{args[2]}"
		self.birthDate = args[3]
		self.phoneNumber = args[4]
		self.email = args[5]
		@address = args[6]
		@passSeriesNumber = args[7]
		@speciality = args[8]
		@experience = 0

        if args.length == 13
            @experience = args[9]

            class << self
                attr_accessor :prevWorkName, :prevWorkPostName, :prevWorkSalary
            end

            @prevWorkName = args[10]
			@prevWorkPostName = args[11]
            @prevWorkSalary = args[12]
        end
    end
	
	
	# Сеттеры
	def birthDate=(val)
		@birthDate = checkDate(val)
	end
	
	def email=(val)
		@email = checkEmail(val)
	end
	
	def fullName=(val)
		@name, @surname, @patronymic = convertFullNameToArray(val)
	end
	
	def phoneNumber=(val)
		@phoneNumber=checkPhoneNumber(val)
	end
	
	
	
	
	def checkDate(date)
		if not isDate(date)
			raise "Некорректная дата"
		end
		
		return date.delete(" ").split(".").map.with_index do
			|datePart, i|  
			if datePart.length == 1 #Исправление числа и месяца
				datePart.insert(0, "0")
			end
			
			if i == 2 and datePart.length == 2 #Исправление года
				if datePart.to_i > 21
					datePart.insert(0, "19")
				else
					datePart.insert(0, "20")
				end
			end
			datePart
		end.join(".")
	end
	
	def checkEmail(email)
		if not isEmail(email)
			raise "Некорректный email"
		end
		
		return email.delete(" ").downcase
	end
	
	def checkFullName(name)
		if not isFullName(name)
			raise "Некорректное ФИО"
		end
		
		return name.gsub(/\s*\-\s*/, "-").split.map.with_index do
			|word, i|
			if i != name.gsub(/\s*\-\s*/, "-").split.length - 1
				word.split("-").map {|subword| subword.capitalize}.join("-")
			else
				if i == 2 #Проверка, является ли отчество двойным
					word.capitalize
				else 
					word.downcase
				end
			end
		end.join(" ")
	end
	
	def checkPhoneNumber(number)
		if not isRusPhoneNum(number)
			raise "Некорректный номер телефона"
		end
		
		return number.delete(" \-()+").insert(1, "-").insert(5, "-") #gsub(/^\d{4}/, "\1-\2\3\4-") #Забагованный вывод почему-то :(
	end
	

	#Конвертирует ФИО в массив, где элементы - это фамилия, имя и отчество
	def convertFullNameToArray(fullName)
		checkedFullName = checkFullName(fullName)
		
		arr = checkedFullName.split
		name = arr[0]
		surname = arr[1]
		patronymic = (arr.length == 3)? arr[2] : "#{arr[2]} #{arr[3]}"
		return name, surname, patronymic
	end

	
	def isDate(str)
		return (str.scan(/^\s*(\d{1,2}\.){2}(\d{2}|\d{4})\s*$/).length == 1 and #Проверка формата
		str.split(".")[0].to_i >= 1 and str.split(".")[0].to_i <= 31 and #Проверка числа
		str.split(".")[1].to_i >= 1 and str.split(".")[1].to_i <= 12) #Проверка месяца
	end
	
	def isEmail(str)
		return str.scan(/^(\s*)?[\w\d\-_\.!~\*'\(\)]+@[\w]{2,}\.[\w]{2,}(\s*)?$/).length == 1
	end
	
	def isFullName(str)
		return str.scan(/^(((\s*)?[a-zA-Zа-яА-Я]+((\s*)?\-(\s*)?[a-zA-Zа-яА-Я]+)?\s)){2}((\s*)?[a-zA-Zа-яА-Я]+(\s+[a-zA-Zа-яА-Я]+)?)(\s*)?$/).length == 1
	end
	
	def isRusPhoneNum(str)
		return str.scan(/^(\s*)?(\+7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
	end
	
	def to_s
		employeeData = "#{@surname} #{@name} #{@patronymic} 
Дата рождения: #{@birthdate} 
Номер телефона: #{@phoneNumber} 
Адрес: #{@address} 
email: #{@email} 
Серия и номер паспорта: #{@passSeriesNumber} 
Специальность: #{@speciality} 
Стаж работы по специальности (в годах): #{@experience}"

		if @experience != 0
			employeeData += "\nПредыдущее место работы: #{@prevWorkName} 
Должность на пред. месте работы: #{@prevWorkPostName} 
Зар.плата на пред. месте работы: #{@prevWorkSalary}"
		end
		
		employeeData
	end
end

testEmp = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")

puts testEmp.name
puts testEmp.surname
puts testEmp.patronymic

testEmp.birthDate = " 1.02.21  "
puts testEmp.birthDate

testEmp.birthDate = "02.3.98"
puts testEmp.birthDate

#Выбрасывают исключения
#testEmp.birthDate = "98.12.21"
#testEmp.birthDate = "8-12-21"