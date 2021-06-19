require_relative "TerminalViewListEmployee"

include TerminalView

terminal = TerminalViewListEmployee.new

# empsList = terminal.readEmployeesFromFile("Emps.txt")

# puts(empsList)

crypt = Cryptographer.new

file = File.new("Emps.txt", "r:UTF-8")
terminal.divideBySeparatorLine(file.read).each {|empText| puts "\n\n" + Employee.createEmployeeFromData(empText).to_s}