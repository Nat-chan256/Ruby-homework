require_relative "ListEmployee"

include ListEmp

empList = ListEmployee.new
emp1 = Employee.new("Иванов", "Иван-  Руслан", "Иванович", "30.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224125", "Программист")
emp2 = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "Ставропольская 15", "0315 224124", "Инженер", 10, "KUBGU", "Старший преподаватель", 40000)
emp3 = Employee.new("Сорокина", "Мария", "Ивановна", "08.09.1970", "+79957517955", "maria@mail.ru", "Петра Метальникова 8", "0315 224345", "Учитель русского языка", 25, "МБОУ СОШ №15", "Завуч", 25000)
emp4 = Employee.new("Захаренко", "Анастасия", "Викторовна", "16.11.1983", "+79996677755", "enot@mail.ru", "Набережная д.14 кв.5", "0315 223344", "Товаровед", 13, "ООО РосТорг", "Заведущая пищевым отделом", 30000)

empList.addEmployee(emp1)
empList.addEmployee(emp2)
empList.addEmployee(emp3)
empList.addEmployee(emp4)

# puts "============================================="
# puts "СОРТИРОВКА ПО ФАМИЛИИИ"
# empList.sortBySurname!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО ИМЕНИ"
# empList.sortByName!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО ФАМИЛИИ"
# empList.sortByPatronymic!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО АДРЕСУ"
# empList.sortByAddress!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО СПЕЦИАЛЬНОСТИ"
# empList.sortBySpeciality!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО СТАЖУ РАБОТЫ"
# empList.sortByExperience!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО НОМЕРУ ТЕЛЕФОНА"
# empList.sortByPhoneNumber!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО EMAIL"
# empList.sortByEmail!
# empList.showEmployees

# puts "\n\n============================================="
# puts "СОРТИРОВКА ПО ДАТЕ РОЖДЕНИЯ"
# empList.sortByBirthDate!
# empList.showEmployees

puts "\n\n============================================="
puts "СОРТИРОВКА ПО ПАСПОРТНЫМ ДАННЫМ"
empList.sortByPassportData!
empList.showEmployees