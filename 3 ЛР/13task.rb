require_relative "TerminalViewListEmployee"

include TerminalView

terminal = TerminalViewListEmployee.new
empsList = terminal.readEmployeesFromFile("Emps.txt")
puts(empsList)
