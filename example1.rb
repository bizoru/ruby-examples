foobar = 'user'

# Eval a variable content
puts "#{foobar} how are you?"

# This is a index
puts foobar[1..2]

# Again each
#(1..2).to_a.each do |x| puts x.to_s+" times" end 

# Shift to remove first item
g = (1..10).to_a
puts g.inspect
g.shift
puts g.inspect
g.shift
puts g.inspect
g.push([2,3])
puts g.inspect
g.flatten
puts g.inspect

# Hash or Map
mymap = {:name => "User", :age => 25}
puts mymap.inspect
puts mymap[:name]

mymap.each do |index,key|
	puts "#{index} = #{key}"
end


# Range
birth_year = 1988
date_range = 1900..1999

# Included on the range?
if date_range.include? birth_year 
	puts "Yes!!"
end

# Going two years step
#date_range.step(2) do |x| puts x end

# Check class and super class
nil_obj = nil
puts nil_obj.class.superclass

# Check object type
a = "Steven"
puts a.is_a? String 

# Check case equality
#puts (:Steven === "Steven")
#puts birth_year.between?(date_range)

# Check if it is in the range
puts birth_year.between?(1900,2000)

fridge = "Fridge"

# The Fridge is tainted!!
fridge.taint

if fridge.tainted? 
	puts "OMG the fridge is tainted "
end


fridge.freeze

puts " Is the Fridge Fronzen?  #{fridge.frozen?}"

#  Like this !
# fridge[0] = "f"
a  = [1,2,3,4]
b = [3,4,5,6]
result =  a &= b 
puts result.inspect

# Array automatic convertion
values = 1,2,34,5
puts values.inspect
x,y = values

# Parallel Assigment
puts x.inspect
puts y.inspect

puts "---------------------------"
#Fairly Obscure Ruby Feature "Flip flop"
(1..10).each{ |x| puts x if x==2..x==8}


name = "User"
print name == "User" ? 'Allowed': 'Not allowed'

# Fa
puts "finish"

