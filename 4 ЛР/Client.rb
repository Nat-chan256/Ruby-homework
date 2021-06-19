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
	end
end