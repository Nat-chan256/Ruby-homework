require_relative "Employee"
include Emp

testEmp = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")

testEmp.birthDate = " 1.02.21  "
puts testEmp.birthDate

testEmp.birthDate = "02.3.98"
puts testEmp.birthDate

#Выбрасывают исключения
#testEmp.birthDate = "98.12.21"
#testEmp.birthDate = "8-12-21"