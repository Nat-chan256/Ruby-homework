require 'mysql2'

client = Mysql2::Client.new(:host => "localhost", :username => "root")

client.query("USE pawnshop")
client.query("ALTER TABLE mortgagedProperty ADD COLUMN cost INT AFTER propertyName")
client.close