#!/usr/bin/ruby

# Testing inject method for enumerable objects

my_numbers = 1..10

results = my_numbers.inject { |result,item| result + item  }
puts results.inspect

p my_numbers

# Testing map an collect
results2 = my_numbers.map { |element| element + 1}
p results2.inspect

# Find All
results3 = my_numbers.find_all {|element| element > 1 && element < 8}
p results3.inspect

# Select
results4 = my_numbers.select { |element| element > 1 && element < 8}
p results4.inspect

# Random
results5 = rand(1..6)
p results5.inspect

