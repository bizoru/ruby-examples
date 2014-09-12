#!/usr/bin/ruby

require 'mechanize'

agent = Mechanize.new do |a|
  a.user_agent_alias = 'Mac Safari'
end
url = ""
page = agent.get(url)

puts page.title

form = page.forms.first # => Mechanize::Form
form.fields.each { |f| puts f.name }
form['username'] = ''
form['password'] = ''
puts 'Loggin'
page2 = form.submit
puts 'Logged'
puts page2.title
