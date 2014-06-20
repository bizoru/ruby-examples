#!/usr/bin/ruby

require_relative 'ruby6'

class Robot < Ruby6::Intelligence
   attr_accessor :name, :type, :t

   def initialize
   	names = ['Arthur','Alice','Bob','Foobar','Iceman']
   	@name = names[rand(names.length)]
   	@@type = 'Basic Robot'
   	@container = "I am alive: #{@name}"
   end

   def sayHello
   	  super
   end

end

def alert(signal)
      puts "\033[31m#{signal}\033[0m"
end

robots_live = {}

limit = rand(10)
ran = 1..limit
ran.each do |x| 
	r = Robot.new
	if robots_live.include? r.name
		next
	else
        robots_live[r.name] = r
	end

   	  
end 
puts robots_live.keys.to_a.inspect

puts "Unique robots" if robots_live.keys.uniq.size == robots_live.keys.size 
alert('Finished')

