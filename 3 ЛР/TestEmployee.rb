module TestEmp
require_relative "Employee"

include Emp

class TestEmployee
	
	def initialize
		@emp = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
	end
	
	def createEmployees
		
		ivan = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
		 
		fedor = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "Ставропольская 15", "0315 224124", "Инженер", 10, "KUBGU", "Старший преподаватель", 40000)
 
		maria = Employee.new("Сорокина", "Мария", "Ивановна", "08.09.1970", "+79957517955", "maria@mail.ru", "Петра Метальникова 8", "0315 224345", "Учитель русского языка", 25, "МБОУ СОШ №15", "Завуч", 25000)
							  
		#Вызывает исключение
		#fakeMaria = Employee.new("Сорокина", "Мария", "Ивановна")
							  
		return [ivan, fedor, maria]
	end
	
	def testDate(value)
		begin
			@emp.birthDate = value
			return @emp.birthDate
		rescue
			return nil
		end
	end
	
	def testEmail(value)
		begin
			@emp.email = value
			return @emp.email
		rescue
			return nil
		end
	end
	
	def testFullName(value)
		begin
			@emp.fullName = value
			return "#{@emp.name} #{@emp.surname} #{@emp.patronymic}"
		rescue
			return nil
		end
	end
	
	def testPassportData(value)
		begin
			@emp.passSeriesNumber = value
			return @emp.passSeriesNumber
		rescue
			return nil
		end
	end
	
	def testPhoneNumber(value)
		begin
			@emp.phoneNumber = value
			return @emp.phoneNumber
		rescue
			return nil
		end
	end
end

end
