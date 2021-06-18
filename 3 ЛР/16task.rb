require_relative "ListEmployee"

include ListEmp

empList = ListEmployee.new
emp1 = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224125", "Программист")
emp2 = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "Ставропольская 15", "0315 224124", "Инженер", 10, "KUBGU", "Старший преподаватель", 40000)
empList.addEmployee(emp1)
empList.addEmployee(emp2)

# Поиск сотрудника по email
puts "ПОИСК ПО EMAIL"
empE1 = empList.findEmployeeByEmail("myMail@mail.ru")
puts empE1
empE2 = empList.findEmployeeByEmail("wrong_mail@mail.ru")
puts empE2
# Исключение
# empE3 = empList.findEmployeeByEmail("not_mail_at_all")
# puts empE3

# Поиск сотрудника по номеру телефона
puts "\n\nПОИСК ПО НОМЕРУ ТЕЛЕФОНА"
empE1 = empList.findEmployeeByPhoneNumber("89957517964")
puts empE1
empE2 = empList.findEmployeeByPhoneNumber("+79957517900")
puts empE2
# Исключение
# empE3 = empList.findEmployeeByPhoneNumber("999999")
# puts empE3

# Поиск сотрудника по паспортным данным
puts "\n\nПОИСК ПО ПАСПОРТНЫМ ДАННЫМ"
empE1 = empList.findEmployeeByPassportData("0315", "224125")
puts empE1
empE2 = empList.findEmployeeByPassportData("0000", "121212")
puts empE2
# Исключение
# empE3 = empList.findEmployeeByPassportData("99999999", "111")
# puts empE3