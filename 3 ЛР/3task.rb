require_relative "Employee"
include Emp

testEmp = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru",  "Красная 12", "0315 224124", "Программист")

testEmp.phoneNumber = "8(900)246 78 33"

puts testEmp.phoneNumber