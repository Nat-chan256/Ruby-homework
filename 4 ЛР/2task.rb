require_relative "TestModule"

include TestModule

testClient = TestClient.new
testClient.createClients

testLoans = TestLoan.new
testLoans.createLoans

puts "КЛИЕНТЫ"
testClient.clientsList.each {|client| puts "#{client}\n\n"}

puts "\n\nЗАЙМЫ"
testLoans.loansList.each{|loan| puts "#{loan}\n\n"}