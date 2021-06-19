module ClientModule
	class Client
		attr_accessor :surname, :name, :patronymic, :passportData, :address, :birthDate

		def initialize(surname, name, patronymic, birthDate, passportData, address)
			self.surname = surname
			self.name = name
			self.patronymic = patronymic
			self.passportData = passportData
			self.address = address
			self.birthDate = birthDate
		end

		# Setters

		def fullName= (fullName)
			@surname, @name, @patronymic = convertFullNameToArray(fullName)
		end

		def birthDate= (birthDate)
			@birthDate = Client.normalizeDate(birthDate)
		end

		#Конвертирует ФИО в массив, где элементы - это фамилия, имя и отчество
		def convertFullNameToArray(fullName)
			checkedFullName = Client.normalizeFullName(fullName)
			
			arr = checkedFullName.split
			name = arr[0]
			surname = arr[1]
			patronymic = (arr.length == 3)? arr[2] : "#{arr[2]} #{arr[3]}"
			return name, surname, patronymic
		end

		def self.isDate(str)
			return (str.scan(/^\s*(\d{1,2}\.){2}(\d{2}|\d{4})\s*$/).length == 1 and #Проверка формата
			str.split(".")[0].to_i >= 1 and str.split(".")[0].to_i <= 31 and #Проверка числа
			str.split(".")[1].to_i >= 1 and str.split(".")[1].to_i <= 12) #Проверка месяца
		end

		def self.isFullName(str)
			return str.scan(/^(((\s*)?[a-zA-Zа-яА-Я]+((\s*)?\-(\s*)?[a-zA-Zа-яА-Я]+)?\s)){2}((\s*)?[a-zA-Zа-яА-Я]+(\s+[a-zA-Zа-яА-Я]+)?)(\s*)?$/).length == 1
		end

		def self.normalizeDate(str)
			if not Client.isDate(str)
				raise "Некорректная дата"
			end
			
			return str.delete(" ").split(".").map.with_index do
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

		def self.normalizeFullName(str)
			if not Client.isFullName(str)
				raise "Некорректное ФИО"
			end
			
			return str.gsub(/\s*\-\s*/, "-").split.map.with_index do
				|word, i|
				if i != str.gsub(/\s*\-\s*/, "-").split.length - 1
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

		def to_s
			"Фамилия: #{self.surname}
Имя: #{self.name}
Отчество: #{self.patronymic}
Дата рождения: #{self.birthDate}
Серия и номер паспорта: #{self.passportData.series} #{self.passportData.number}
Выдан: #{self.passportData.issuedBy}; дата выдачи: #{self.passportData.issueDate}
Гражданство: #{self.passportData.citizenship}
Адрес: #{self.address}"
		end
	end

	class PassportData
		attr_accessor :series, :number, :citizenship, :issuedBy, :issueDate

		def initialize(series, number, citizenship, issuedBy, issueDate)
			self.series = series
			self.number = number
			self.citizenship = citizenship
			self.issuedBy = issuedBy
			self.issueDate = issueDate
		end

		# Сеттеры

		def issueDate= (date)
			@issueDate = Client.normalizeDate(date)
		end

		def number= (number) 
			@number = PassportData.normalizeNumber(number)
		end

		def series= (series)
			@series = PassportData.normalizeSeries(series)
		end


		def self.isNumber(str)
			str.scan(/^\s*\d{6}\s*$/).length == 1
		end

		def self.isSeries(str)
			str.scan(/^\s*\d{4}\s*$/).length == 1
		end

		def self.normalizeSeries(str)
			if not PassportData.isSeries(str)
				raise "Некорректная серия паспорта"
			end

			str.strip
		end

		def self.normalizeNumber(str)
			if not PassportData.isNumber(str)
				raise "Некорректный номер паспорта"
			end

			str.strip
		end
	end
end