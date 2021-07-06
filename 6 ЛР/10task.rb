require_relative "../4 ЛР/ClientsListModule"

include ClientsListModule

# Create clients list
clientsList = ClientsList.new
passportData1 = PassportData.new("9494", "949494", "Российская Федерация",  
	"Отдел внутренних дел 'Гольяново' гор. Москвы", "10.08.2004") 
vika = Client.new("Романченко", "Виктория", "Викторовна",  "27.07.1979", passportData1, "Петра Метальникова д.14") 
passportData2 = PassportData.new("9509", "509509", "Российская Федерация",  
	"Отдел внутренних дел 'Гольяново' гор. Москвы", "10.08.2004") 
tolik = Client.new("Рубцов", "Анатолий", "Сергеевич",  "27.07.1979", passportData2, "Петра Метальникова д.14") 
clientsList.addClient(vika)
clientsList.addClient(tolik)

# Write to XML
clientsList.writeListXML("testXml.xml")