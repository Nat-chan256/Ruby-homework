module ClientsListModule
	require_relative "Client"
	include ClientModule
	require 'date'

	class ClientsList
		attr_reader :clientsList

		def initialize
			@clientsList = Array.new
		end

		def addClient(client)
			@clientsList << client
		end

		def addClients(clients)
			@clientsList = @clientsList + clients
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
			series = PassportData.normalizeSeries(passportSeries)
			number = PassportData.normalizeNumber(passportNumber)

			@clientsList.select{|client| client.passportData.series == series and client.passportData.number == number}
		end

		def sortByAddress!
			@clientsList.sort_by!{|client| client.address}
		end

		def sortByBirthDate!
			@clientsList.sort_by!{|client| Date.parse(client.birthDate)}
		end

		def sortByName!
			@clientsList.sort_by!{|client| client.name}
		end

		def sortByPatronymic!
			@clientsList.sort_by!{|client| client.patronymic}
		end

		def sortByPassportData!
			@clientsList.sort_by!{|client| "#{client.passportData.series} #{client.passportData.number}"} 
		end

		def sortBySurname!
			@clientsList.sort_by!{|client| client.surname}
		end

		def to_s
			clientsList.join("\n\n")
		end

	end
end