module Emp

require_relative "Crypt"

include Crypt

	class Employee

		attr_accessor :surname, :name, :patronymic,
			:address, :speciality,
			:experience
		
		attr_reader :phoneNumber, :email, :birthDate, :passSeriesNumber
		
		def initialize(*args)
			if not (args.length == 9 or args.length == 13)
				raise "Количество аргументов должно быть равно 9 или 13"
			end
		  
			self.fullName = "#{args[0]} #{args[1]} #{args[2]}"
			self.birthDate = args[3]
			self.phoneNumber = args[4]
			self.email = args[5]
			self.address = args[6]
			self.passSeriesNumber = args[7]
			self.speciality = args[8]
			self.experience = 0

			if args.length == 13
				self.experience = args[9]

				class << self
					attr_accessor :prevWorkName, :prevWorkPostName, :prevWorkSalary
				end

				self.prevWorkName = args[10]
				self.prevWorkPostName = args[11]
				self.prevWorkSalary = args[12]
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
		
		def passSeriesNumber=(val)
			@passSeriesNumber = checkPassportData(val)
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
		
		def checkPassportData(passportData)
			if not isPassportData(passportData)
				raise "Некорректные паспортные данные"
			end
			
			return passportData.split.join(" ")
		end
		
		def checkPhoneNumber(number)
			if not isRusPhoneNum(number)
				raise "Некорректный номер телефона"
			end
			
			return number.delete("-").delete(" ").delete("(").delete(")").delete("+").insert(1, "-").insert(5, "-") 
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

		
		#Создание сотрудника на основе данных, предоставленных во входном тексте
		#Предполагается, что серия и номер паспорта зашифрованы
		def self.createEmployeeFromData(text)
			lines = text.lines
			
			if not (lines.size() == 8 or lines.size() == 11)
				return nil
			end
			
			crypt = Cryptographer.new
			
			#begin
				if lines.size() == 8
					return Employee.new(lines[0].split[0], #Фамилия
						lines[0].split[1], #Имя
						lines[0].split[2], #Отчество
						lines[1].split(":")[1], #Дата рождения
						lines[2].split(":")[1], #Номер телефона
						lines[4].split(":")[1], #email 
						lines[3].split(":")[1], #Адрес
						lines[5].split(":")[1],
						#crypt.decrypt(lines[5].split(":")[1].strip), #Серия и номер паспорта
						lines[6].split(":")[1]) #Специальность
				else
					return Employee.new(lines[0].split[0], #Фамилия
						lines[0].split[1], #Имя
						lines[0].split[2], #Отчество
						lines[1].split(":")[1], #Дата рождения
						lines[2].split(":")[1], #Номер телефона
						lines[4].split(":")[1], #email 
						lines[3].split(":")[1], #Адрес
						lines[5].split(":")[1],
						#crypt.decrypt(lines[5].split(":")[1].strip), #Серия и номер паспорта
						lines[6].split(":")[1], #Специальность
						lines[7].split(":")[1].to_i, #Стаж работы
						lines[8].split(":")[1], #Пред. место работы
						lines[9].split(":")[1], #Должность на пред. месте работы
						lines[10].split(":")[1].to_i) #Зар.плата на пред. месте работы
				end
			#rescue
				return nil
			#end
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
		
		def isPassportData(str)
			return str.scan(/\s*\d{4}\s+\d{6}\s*/).length == 1
		end
		
		def isRusPhoneNum(str)
			return str.scan(/^(\s*)?(\+?7|8)([(\- ]?\d{3}[)\- ]?)(\d{3}[\- ]?\d{2}[\- ]?\d{2}|\d{2}[\- ]?\d{3}[\- ]?\d{2})(\s*)?$/).length == 1
		end
		
		def to_s
			employeeData = "#{@surname} #{@name} #{@patronymic} 
	Дата рождения: #{@birthDate} 
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
end