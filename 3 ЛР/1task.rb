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
end


ivan = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964",
                      "myMail@mail.ru", "0315 224124", "Программист", "Красная 12")
 
fedor = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912",
                      "fedor@mail.ru", "0315 224124", "Инженер", "Ставропольская 15", 10, "KUBGU", "Старший преподаватель", 40000)
 
 