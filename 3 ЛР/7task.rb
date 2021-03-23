require_relative "Employee"
include Emp

testEmp = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")

testEmp.passSeriesNumber = "   1234 123123"
puts testEmp.passSeriesNumber

#Выбрасывают исключение
#testEmp.passSeriesNumber = "   1234 12"
#testEmp.passSeriesNumber = "   1234dfsd"


