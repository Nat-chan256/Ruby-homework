answer = "1"

while answer != "0"

	puts "\nМеню:
	0. Выход 
	1. Приветствие
	2. Вывод всех методов String
	3. Выполнение методов класса String
	4. Вывод переменных и констант класса String
	5. Примеры форматированных строк"

	answer = STDIN.gets.chomp.downcase.strip 

	case answer
		when "1"
			#Получение аргумента из командной строки
			if ARGV.length == 1
				puts "Добрый день, " + ARGV[0]
			else
				puts "Использование программы: ruby second.rb <имя>"
			end

		when "2"
			#Вывод всех методов String
			puts "\nМЕТОДЫ КЛАССА STRING\n"
			String.methods.each {|meth| puts meth}
			
		when "3"
			#Выполнение методов класса String
			puts "\n1. try_convert: "
			puts "try_convert(12) = " + (String.try_convert("12") == nil ? "nil" : String.try_convert("12")) 
			puts "try_convert(/some reg ex/) = " + (String.try_convert(/some reg ex/) == nil ? "nil" : String.try_convert(/some reg ex/) )
			
			puts "\n2. * :"
			puts "\"Kawaii\" * 5 = " + ("Kawaii " * 5)
			puts "\"Kawaii\" * 0 = " + ("Kawaii " * 0)
			
			puts "\n3. + :"
			puts "\"Concatination \" + \"of \" + \"lines\" = " + ("\"Concatination " + "of " + "lines\"")
			
			puts "\n4. << :"
			str1 = "Hello"
			puts "str1 << \" from\" << \" Ruby\" << 33 = " + str1 << " from" << " Ruby" << 33
			
			puts "\n5. <=> :"
			puts "\"abc\" <=> \"abd\" = " + ("abc" <=> "abd").to_s
			puts "\"bbb\" <=> \"aaaaa\" = " + ("bbb" <=> "aaaa").to_s
			puts "\"abc\" <=> \"Abc\" = " + ("abc" <=> "Abc").to_s
			puts "\"abc\" <=> \"abc\" = " + ("abc" <=> "abc").to_s
			puts "\"\" <=> \"abc\" = " + ("" <=> "abc").to_s
			puts "1 <=> \"abc\" = " + ((1 <=> "abc") == nil ? "nil" : (1 <=> "abc").to_s)
			
			puts "\n6. === : "
			puts "/l.*/ === \"Some line\" = " + (/l.*/ === "line").to_s
			puts "/l.*/ === \"Other string\" = " + (/l.*/ === "Other string").to_s
			puts "\"Line1\" === \"Line2\" = " + ("Line1" === "Line2").to_s
			puts "str1 === \"Hello\" = " + (str1 === "Hello").to_s
			
			puts "\n7. [] :"
			puts "str1[2] = " + str1[2]
			puts "str1[0, 3] = " + str1[0, 3]
			puts "str1[0..3] = " + str1[0..3]
			puts "str1[\"substr\"] = " + (str1["substr"] == nil ? "nil" : str1["substr"])
			puts "str1[\"ll\"] = " + str1["ll"]
			puts "str1[-1] = " + str1[-1]
			puts "str1[10] = " + (str1[10] == nil ? "nil" : str1[10])
			
			puts "\n8. ascii_only? : "
			puts "\"abc\".ascii_only? = " + "abc".ascii_only?.to_s
			puts "\"abc\\u{256}\".ascii_only? = " + "abc\u{256}".ascii_only?.to_s
			
			puts "\n9. bytes :"
			puts "\"Hello\".bytes = " + "Hello".bytes.to_s
			
			puts "\n10. byteslice : "
			puts "\"hello\".byteslice(0) = " + "hello".byteslice(0)
			puts "\"hello\".byteslice(-2) = " + "hello".byteslice(-2)
			puts "\"hello\".byteslice(0, 3) = " + "hello".byteslice(0, 3)
			puts "\"hello\".byteslice(0..3) = " + "hello".byteslice(0..3)
			
			puts "\n11. capitalize! :"
			kawaiiStr = "kawaii"
			puts "kawaiiStr.capitalize! = " + kawaiiStr.capitalize!
			puts "kawaiiStr.capitalize! = " + (kawaiiStr.capitalize! == nil ? "nil" : kawaiiStr.capitalize!)
			puts "\"KaWaIi\".capitalize! = " + "KaWaIi".capitalize!
			
			puts "\n12. casecmp? :"
			puts "\"hello\".casecmp?(\"HeLlO\") = " + "hello".casecmp?("HeLlO").to_s
			puts "\"hell\".casecmp?(\"hello\") = " + "hell".casecmp?("hello").to_s
			puts "\"hella\".casecmp?(\"hello\") = " + "hella".casecmp?("hello").to_s
			puts "\"hella\".casecmp?(1) = " + ("hella".casecmp?(1) == nil ? "nil" : "hella".casecmp?(1).to_s)
			
			puts "\n13. chars :"
			puts "\"Characters\".chars = " + "Characters".chars.to_s
			
			puts "\n14. chomp :"
			puts "\"hello\".chomp = " + "hello".chomp
			puts "\"hello\\n\".chomp = " + "hello\n".chomp
			puts "\"hello\\t world\".chomp = " + "hello\t world".chomp
			puts "\"hello\".chomp(\"o\") = " + "hello".chomp("o")
			puts "\"hello\".chomp(\"l\") = " + "hello".chomp("l")
			
			puts "\n15. chr: "
			puts "\"Hello\".chr = " + "Hello".chr
			
			puts "\n16. codepoints :"
			puts "\"abcdefgh\".codepoints = " + "abcdefgh".codepoints.to_s
			
			puts "\n17. count :"
			puts "\"some kind of sentence\".count \"so\" = " + ("some kind of sentence".count "so").to_s
			puts "\"some kind of sentence\".count \"so\", \"s\" = " + ("some kind of sentence".count "so", "s").to_s
			puts "\"some kind of sentence\".count \"so\", \"^s\" = " + ("some kind of sentence".count "so", "^s").to_s
			
			puts "\n18. delete :"
			puts "\"hello\".delete \"l\", \"lo\" = " + ("hello".delete "l", "lo")
			puts "\"hello\".delete \"lo\" = " + ("hello".delete "lo")
			
			puts "\n19. delete_suffix : "
			puts "\"hello\".delete_suffix(\"lo\") = " + "hello".delete_suffix("lo")
			puts "\"hello\".delete_suffix(\"lo\") = " + "hello".delete_suffix("he")
			
			puts "\n20. dump : "
			puts "\"Hello \\t world \\n\".dump = " + "Hello \t world \n".dump
			
			puts "\n21. each_char : "
			puts "\"hello\".each_char \{ |c| print c, '$' \} = " 
			"hello".each_char { |c| print c, '$' }
			
			puts "\n\n22. each_codepoint : "
			puts "\"hello\".each_codepoint \{ |c| print c, ' ' \} = " 
			"hello".each_codepoint { |c| print c, ' ' }
			puts ""
			
			puts "\n23. empty? : "
			puts "\"hello\".empty? = " + "hello".empty?.to_s
			puts "\" \".empty? = " + " ".empty?.to_s
			puts "\"\".empty? = " + "".empty?.to_s
			
			puts "\n24. encoding : "
			puts "\"Hello\".encoding = " + "Hello".encoding.to_s
			
			puts "\n25. eql? :"
			puts "\"hello\".eql?(\"Hello\") = " + "hello".eql?("Hello").to_s
			puts "\"hello\".eql?(\"hello\") = " + "hello".eql?("hello").to_s
			puts "\"hello\".eql?(\"Bang\") = " + "hello".eql?("Bang").to_s
			
			puts "\n26. freeze :"
			frozenStr = "Frozen line".freeze
			#frozenStr << " hello" #Исключение
			
			puts "\n27. getbyte :"
			puts "\"Hello\".getbyte(3) = " + "Hello".getbyte(3).to_s
			
			puts "\n28. hash : "
			puts "\"Hello\".hash = " + "Hello".hash.to_s
			
			puts "\n29. include? :"
			puts "\"hello\".include? \"he\" = " + ("hello".include? "he").to_s
			puts "\"hello\".include? \"eh\" = " + ("hello".include? "eh").to_s
			
			puts "\n30. replace :"
			puts "\"hello\".replace \"goodbue\" = " + ("hello".replace "goodbue")
			
			puts "\n31. intern :"
			puts "\"Koala\".intern = " + "Koala".intern.to_s
			
			puts "\n32. lines : "
			puts "\"hello\\nworld\\n\".lines = " + "hello\nworld\n".lines.to_s
			puts "\"hello  world\".lines(' ') = " + "hello  world".lines(' ').to_s
			puts "\"hello\\nworld\\n\".lines(chomp: true) = " + "hello\nworld\n".lines(chomp: true).to_s
			
			puts "\n33. lstrip :"
			puts "   hello".lstrip
			puts "hello".lstrip
			
			puts "\n34. succ :"
			puts "99".succ
			puts "abc".succ
			puts "a99".succ
			
			puts "\n35. ord :"
			puts "b".ord
			
			puts "\n36. reverse :"
			puts "abcdef".reverse
			
			puts "\n37. rpartition :"
			puts "hello".rpartition("l").to_s
			puts "hello".rpartition("x").to_s
			puts "hello".rpartition(/.l/).to_s
			
			puts "\n38. scan :"
			puts "cruel word".scan(/\w+/).to_s
			"cruel word".scan(/(.)(.)/) {|x,y| print y, x}
			print "\n"
			
			puts "\n39. setbyte :"
			str = "Hello."
			str.setbyte(5, 33)
			puts str
			
			puts "\n40. split :"
			puts "Hello world".split.to_s
			puts "Hello world".split("l").to_s
			puts "Hello world".split(/.l/).to_s
			
			puts "\n41. start_with :"
			puts "hello".start_with?("hell", "heaven").to_s
			
			puts "\n42. sub:"
			puts "hello".sub(/[aeiou]/, '*')
			puts "hello".sub(/[aeiou]/, '<\1>')
			
			puts "\n43. swapcase: "
			puts "HeLlO".swapcase
			
			puts "\n44. to_c :"
			puts "9".to_c
			puts "-i".to_c
			puts "3-4i".to_c
			puts "line".to_c

			puts "\n45. tr :"
			puts "hello".tr("el", "ip")
			puts "hello".tr("aeiou", "*")
			puts "hello".tr("aeiou", "AA*")
			
			puts "\n46. upcase :"
			puts "heLLo".upcase
			
		when "4"
			puts "1. $/ = " + $/ + "smt else"
			
			puts "2. $. = " + ($.).to_s
			
			puts "3. $LOADED_FEATURES = " + $LOADED_FEATURES.to_s
			
			puts "4. $LOAD_PATH = " + $LOAD_PATH.to_s
			
		when "5"
			name = "Ann"
			age = 22
			puts sprintf("sprintf: Hello, %s. Seems like you are %d years old", name, age)
			
			puts "\#\{expr\}: Hello, #{name}. Seems like you are #{age} years old"
			
			
	end
end