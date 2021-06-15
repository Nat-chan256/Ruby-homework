require_relative "TerminalViewListEmployee"

include TerminalView

ivan = Employee.new("Иванов", "Иван", "Иванович", "03.04.1988", "+79957517964", "myMail@mail.ru", "Красная 12", "0315 224124", "Программист")
		 
fedor = Employee.new("Федоров", "Федор", "Федорович", "03.04.1986", "+79957517912","fedor@mail.ru", "Ставропольская 15", "0315 224124", "Инженер", 10, "KUBGU", "Старший преподаватель", 40000)
 
maria = Employee.new("Сорокина", "Мария", "Ивановна", "08.09.1970", "+79957517955", "maria@mail.ru", "Петра Метальникова 8", "0315 224345", "Учитель русского языка", 25, "МБОУ СОШ №15", "Завуч", 25000)

terminal = TerminalViewListEmployee.new

terminal.addEmployee(ivan)
terminal.addEmployee(fedor)
terminal.addEmployee(maria)

terminal.writeEmployeesToFile("Emps.txt")

terminal.writeEmployeesToFileWithEcnryption("EmpsEnc.txt")
