require_relative "Employee"
include Emp

testEmp = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
testEmp.email = "ivanIvanov.123@mail.com"
puts testEmp.email

#Выбрасывает сключение
#testEmp.email = "notEmail@smth"