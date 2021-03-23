require_relative "Employee"
include Emp

testEmp = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
testEmp.fullName = "  Салтыков - щЕдрин Иван-Руслан Ахмед заде  "
puts "#{testEmp.name} #{testEmp.surname} #{testEmp.patronymic}"

testEmp.fullName = "  Иванов Иван    Иванович"
puts "#{testEmp.name} #{testEmp.surname} #{testEmp.patronymic}"

#Выбрасывает исключение
#testEmp.fullName = "  Иванов Иван    "



