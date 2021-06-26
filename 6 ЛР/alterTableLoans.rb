require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root")

client.query("USE pawnshop")
client.query("ALTER TABLE loans ADD UNIQUE unique_index(clientPassportSeries, clientPassportNumber, grantingDate)")
client.close