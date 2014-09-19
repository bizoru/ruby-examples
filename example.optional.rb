#!/usr/bin/ruby

def chat(message="Hi!",to="you",from="me")
  "From: #{from} To: #{to} Message: #{message}"
end

puts chat "Welcome to my world", "Anyone", "Ruby"
puts chat "Hi!","Anyone"
puts chat "Bye!"
    