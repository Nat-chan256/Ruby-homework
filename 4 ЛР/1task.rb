require_relative "Client"
require_relative "Loan"

include ClientModule
include LoanData

require 'date'

passportData = PassportData.new("0913", "667788", 
	"Российская Федерация", 
	"Отделение УФМС России по гор. Москва по району Камовники", Date.new(2014, 8, 9))
client = Client.new("Иванов", "Иван", "Иванович",  Date.new(1969, 7, 20), passportData, "Красная д.14 кв.28")

mortgagedPropertyDict = {"Ноутбук Acer" => 100000, "Золотое кольцо" => 30000}
loan = Loan.new(client, Date.new(2021, 3, 13), Date.new(2021, 11, 4), mortgagedPropertyDict)

puts "КЛИЕНТ"
puts "Фамилия: #{client.surname}"
puts "Имя: #{client.name}"
puts "Отчество: #{client.patronymic}"
puts "Дата рождения: #{client.birthDate}"
puts "Серия и номер паспорта: #{client.passportData.series} #{client.passportData.number}"
puts "Выдан: #{client.passportData.issuedBy}; дата выдачи: #{client.passportData.issueDate}"
puts "Гражданство: #{client.passportData.citizenship}"
puts "Адрес: #{client.address}"


puts "\nЗАЙМ"
puts "ФИО клиента: #{loan.client.surname} #{loan.client.name} #{loan.client.patronymic}"
puts "Дата выдачи займа: #{loan.grantingLoanDate}"
puts "Дата возврата займа: #{loan.loanRepaymentDate}"
puts "Список залогового имущества (вместе с оценкой стоимости): #{loan.mortgagedPropertyDict}"