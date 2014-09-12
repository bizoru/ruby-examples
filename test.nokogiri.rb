#!/usr/bin/ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'
url = ""
page = Nokogiri::HTML(open(url))

puts page.css('title').text
