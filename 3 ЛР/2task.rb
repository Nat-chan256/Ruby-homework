require_relative "TestEmployee"
include TestEmp

test = TestEmployee.new

employees = test.createEmployees
for emp in employees
	puts "\n#{emp}"
end