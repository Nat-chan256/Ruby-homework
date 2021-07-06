require_relative "DB"

include DB

instance = DriverDB.getInstance

instance.close