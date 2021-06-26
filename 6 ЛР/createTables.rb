require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root")

client.query("USE pawnshop")
client.query("create table clients (surname varchar(100), name varchar(100), patronymic varchar(100), passportSeries varchar(100), passportNumber varchar(100), citizenship varchar(100), passportIssuedBy varchar(250), passportIssueDate date, address varchar(250), birthDate date, primary key(passportSeries, passportNumber))")

client.query("CREATE TABLE loans (id int auto_increment, clientPassportSeries varchar(150), clientPassportNumber varchar(150), grantingDate Date, repaymentDate Date, PRIMARY KEY(id), FOREIGN KEY(clientPassportSeries, clientPassportNumber) REFERENCES clients (passportSeries, passportNumber))")

client.query("CREATE TABLE mortgagedProperty (loanId int, propertyName varchar(150), FOREIGN KEY (loanId) REFERENCES loans(id))")

client.close
