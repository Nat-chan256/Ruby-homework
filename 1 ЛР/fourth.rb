print "Введите команду языка ruby: "
rubyCommand = STDIN.gets
puts (eval rubyCommand).to_s

print "Введите команду Вашей ОС: "
osCommand = STDIN.gets
system osCommand