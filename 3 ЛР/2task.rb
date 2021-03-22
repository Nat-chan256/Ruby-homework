class Employee

    attr_accessor :surname, :name, :patronymic,
        :birthdate, :phoneNumber, :address, :email, :passSeriesNumber, :speciality,
        :experience
		

    def initialize(*args)
      
		if not (args.length == 9 or args.length == 13)
			raise "Количество аргументов должно равняться 9 или 13"
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


class TestEmployee
	
	def createEmployees
		
		ivan = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "0315 224124", "Программист", "Красная 12")
		 
		fedor = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "0315 224124", "Инженер", "Ставропольская 15", 10, "KUBGU", "Старший преподаватель", 40000)
 
		maria = Employee.new("Сорокина", "Мария", "Ивановна", "08.09.1970", "+79957517955", "maria@mail.ru", "0315 224345", "Учитель русского языка", "Петра Метальникова 8", 25, "МБОУ СОШ №15", "Завуч", 25000)
							  
		#Вызывает исключение
		#fakeMaria = Employee.new("Сорокина", "Мария", "Ивановна")
							  
		
		puts "#{ivan}\n\n"
		puts "#{fedor}\n\n"
		puts "#{maria}\n\n"
	end
end

test = TestEmployee.new

test.createEmployees