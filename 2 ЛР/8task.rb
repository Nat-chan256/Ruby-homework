puts "Введите числа через пробел"
arr = STDIN.gets.split.map {|elem| elem.to_i}

puts "Максимум: #{arr.max}" 