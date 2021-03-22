class Employee

    attr_accessor :surname, :name, :patronymic,
        :birthdate, :address, :email, :passSeriesNumber, :speciality,
        :experience
	
	attr_reader :phoneNumber
	
	def phoneNumber=(val)
		@phoneNumber=checkPhoneNumber(val)
	end
	
	def checkPhoneNumber(number)
		if not isRusPhoneNum(number)
			raise "Некорректный номер телефона"
		end
		
		return number.delete(" \-()+").insert(1, "-").insert(5, "-") #gsub(/^\d{4}/, "\1-\2\3\4-") #Забагованный вывод почему-то :(
	end
	

    def initialize(*args)
		if not (args.length == 9 or args.length == 13)
			raise "Количество аргументов должно быть равно 9 или 13"
		end
	  
		@surname = args[0]
		@name = args[1]
		@patronymic = args[2]
		@birthdate = args[3]
		@phoneNumber = args[4]
		@address = args[5]
		@email = args[6]
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
	
	def isRusPhoneNum(number)
		return number.scan(/^(\s*)?(\+7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
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


testEmp = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "0315 224124", "Программист", "Красная 12")

testEmp.phoneNumber = "8(900)246 78 33"

puts testEmp.phoneNumber