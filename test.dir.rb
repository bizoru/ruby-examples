#!/usr/bin/env ruby
puts "Hi!"


def status(s)
	if s
		return "yes"
	end
	return "no"
end

files = Dir.entries(".")
puts files.inspect

files.each  { |file|
   puts file + " Is Directory " + status(File.directory? file)
 }

if files.include? "blog"
	puts "Blog exist"
end

Dir.mkdir('testing')
