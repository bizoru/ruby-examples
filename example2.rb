test_array = {:name => 'User', :age => 25}
puts test_array.any?
puts test_array.count
puts test_array.length
test_array.each do |key,value|
  puts "The #{key} is: #{value}"
end

