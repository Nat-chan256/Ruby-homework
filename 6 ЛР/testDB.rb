require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root")

client.query("USE pawnshop")
client.query("create table clients (surname varchar(100), name varchar(100), patronymic varchar(100), passportseries varchar(100), passportnumber varchar(100), citizenship varchar(100), passportissuedby varchar(250), passportissuedate date, address varchar(250), birthdate date, primary key(passportseries, passportnumber))")

client.query("CREATE TABLE loans (id int auto_increment, clientPassportSeries varchar(4), clientPassportNumber varchar(6), grantingDate Date, repaymentDate Date, PRIMARY KEY(id), FOREIGN KEY(clientPassportSeries, clientPassportNumber) REFERENCES clients (passportSeries, passportNumber))")

client.query("CREATE TABLE mortgagedProperty (loanId int, propertyName varchar(150), FOREIGN KEY (loanId) REFERENCES loans(id))")

client.close
