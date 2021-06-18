require_relative "ListEmployee"

include ListEmp

empList = ListEmployee.new
emp1 = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
emp2 = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "Ставропольская 15", "0315 224124", "Инженер", 10, "KUBGU", "Старший преподаватель", 40000)
empList.addEmployee(emp1)
empList.addEmployee(emp2)

# Находим сотрудника
emp = empList.findEmployeeByFullName("Федоров", "Федор", "Федорович")
puts emp

# Ищем сотрудника, которого нет в списке
nonExistentEmp = empList.findEmployeeByFullName("Иванов", "Иван", "Иванович")
puts nonExistentEmp

# Некорректно введенное ФИО
# Выбрасывает исключение
# wrongEmp = empList.findEmployeeByFullName("Ааа;", "1111", "sdfsdf")