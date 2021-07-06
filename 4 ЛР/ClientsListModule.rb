module ClientsListModule
	require_relative "Client"
	#require_relative "../6 ЛР/xmlModule"
	include ClientModule
	#include XMLModule
	require 'date'
	require 'yaml'
	require 'forwardable'
	require 'json'

	class ClientsList
		attr_reader :clientsList
	
		include Enumerable
		extend Forwardable
		def_delegators :@clientsList, :each

		def initialize
			@clientsList = Array.new
			# @xmlConverter = XMLConverter.new
		end

		def addClient(client)
			@clientsList << client
		end

		def addClients(clients)
			@clientsList = @clientsList + clients
		end
		
		def addToDB
			dbInstance = DriverDB.getInstance
			dbInstance.addClientsToDB(@clientsList)
		end

		# Updates client in DB
		def changeClient(client)
			updateClient(client)
			dbInstance = DriverDB.getInstance
			dbInstance.changeClient(client)
		end

		def deleteClient(client)
			remove(client)
			dbInstance = DriverDB.getInstance
			dbInstance.deleteClient(client)
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

			@clientsList.select{|client| client.passportData.series == series and client.passportData.number == number}[0]
		end

		def readListJSON(fileName)
			File.open(fileName, 'r:UTF-8') do |file|
				data = JSON.parse(file.read)
				data.each do |key, value|
					passportData = PassportData.new(value["passportSeries"], value["passportNumber"], value["citizenship"], value["passportIssuedBy"], value["passportIssueDate"])
					client = Client.new(value["surname"], value["name"], value["patronymic"], value["birthDate"], passportData, value["address"])
					addClient(client)
				end
			end
		end


		def readListYAML(fileName)
			@clientsList = YAML::load(File.open(fileName))
		end

		def remove(clientToRemove)
			@clientsList.delete_if {|client| client.passportData.series == clientToRemove.passportData.series and client.passportData.number == clientToRemove.passportData.number}
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

		def updateClient(clientToUpdate)
			@clientsList.each {|client| client = clientToUpdate if client.passportData.series == clientToUpdate.passportData.series and client.passportData.number == clientToUpdate.passportData.number}
		end

		def writeListXML(fileName)
			# xml = @xmlConverter.xml(@clientsList)
			# File.open(fileName, 'w') {|file| file.write(xml)}
		end

		def writeListJSON(fileName)
			File.open(fileName,"w:UTF-8") do |file|
				tempHash = {}
				@clientsList.each_with_index do |client, ind|
					tempHash[ind] = {
						"surname": client.surname,
						"name": client.name,
						"patronymic": client.patronymic,
						"passportSeries": client.passportData.series,
						"passportNumber": client.passportData.number,
						"citizenship": client.passportData.citizenship,
						"passportIssuedBy": client.passportData.issuedBy,
						"passportIssueDate": client.passportData.issueDate,
						"birthDate": client.birthDate,
						"address": client.address,
					}
				end
				file.write(JSON.pretty_generate(tempHash))
			end
		end


		def writeListYAML(fileName)
			File.open(fileName, 'w:UTF-8') do |file|
				file.puts(@clientsList.to_yaml)
			end
		end
	end
end