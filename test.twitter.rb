#!/usr/bin/ruby
require 'twitter'
#Create an application on twitter.com and paste your current settings in the follwing lines (consumer key, consumer secret, access token, token secret)
#execute the client using ./test.twitter.rb 'your tweet here'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

tweet = ARGV[0]
puts tweet
client.update(tweet)