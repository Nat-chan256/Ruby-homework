module ClientsListModule
	require_relative "Client"
	include ClientModule

	class ClientsList
		attr_reader :clientsList

		def initialize
			@clientsList = Array.new
		end

		def addClient(client)
			clientsList << client
		end

		def findClientByFullName(surname, name, patronymic)
			fullName = "#{surname} #{name} #{patronymic}"
			if not Client.isFullName(fullName)
				raise "ФИО некорректно"
			end
			fullName = Client.normalizeFullName(fullName)

			@clientsList.select{|client| client.fullName == fullName}
		end

		def findClientByPassportData(passportSeries, passportNumber)
			if not PassportData.isSeries(passportSeries) 
				raise "Серия паспорта некорректна"
			elsif not PassportData.isNumber(passportNumber)
				raise "Номер паспорта некорректен"
			end
			series = PassportData.normalizeSeries(series)
			number = PassportData.normalizeNumber(number)

			@clientsList.select{|client| client.passportData.series == series and client.passportData.number == number}
		end
	end
end