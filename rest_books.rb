#!/usr/bin/ruby

=begin
  To use this script please run
  
  sudo gem install colored
  sudo gem install httparty

  Thats All.

=end

require 'httparty'
require 'colored'

book_name = ARGV[0]
puts "Looking for #{book_name}".yellow.bold

url =  "http://it-ebooks-api.info/v1/search/#{book_name}"
url_details = "http://it-ebooks-api.info/v1/book/"


response = HTTParty.get(url)

if response['Total'].to_i == 0
	puts "No results found"
	exit
end
#puts response.body
#puts response.message
response['Books'].each do |book|
	
	book_detail = HTTParty.get(url_details+book['ID'].to_s)
	puts "Book Title: #{book['Title']}, Download " +  "Link: #{book_detail['Download']}".magenta
end 