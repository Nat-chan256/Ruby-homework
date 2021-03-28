# Для адекватной работы с кириллицей в консоли
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

print "Исходная строка: "
str = STDIN.gets.chomp

months = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
result = Array.new
arr = str.split()

for i in 0..arr.length-3
	if arr[i].scan(/\D/).empty? and arr[i].to_i >= 1 and arr[i].to_i <= 31 and months.index(arr[i+1]) != nil and arr[i+2].scan(/\D/).empty?
		result.push("#{arr[i]} #{arr[i+1]} #{arr[i+2]}")
	end
end

puts result