#!/usr/bin/ruby 

=begin
  This webcrawler will gather all links withing a single HTML file
=end
	

require 'open-uri'
require_relative 'write'
require 'colored'

puts "Starting a new Google...".bold.blue

class RedCrawl
   attr_accessor :links,:urls
def initialize(url)
	@urls = [url]
	@links = []
	
end
	
def process(body)
	
	start_position = body.index("href")
	if start_position.nil?
		return ['','']
	end
	body = body[start_position+1,body.size]

	colon_1 = body.index("\"")
	body = body[colon_1+1,body.size]

	colon_2 = body.index("\"",colon_1+1)
	link_preview = body[0,colon_2]
	if link_preview[link_preview.size-1] == "/"
		link_preview = link_preview[0,link_preview.size-1]
    end
	if !link_preview.include?("http://") && !link_preview.include?("https://")
		return ['',body]
	end
	if link_preview.include?("<") or link_preview.include?(">")
		return ['',body]
	end
	[link_preview,body]
end

def crawl
	
	data = ""
	page = ""
   
    @urls.each do |url|
      
      
      begin
      data = open(url)
      page = data.read
      data.close
      puts "Visiting: ".bold.yellow + "#{url}"
      rescue
        puts "Error loading website : #{url}".bold.red
      end

    end
    
    

    while page.size > 0
      result = process(page)
      link = result[0]
      if !links.include? link
        @links.push(link) if !link.empty?	
      end
      
      page = result[1]
    end
end

end

class Sandbox

	def initialize
	  @rc = RedCrawl.new('http://oneminutecode.com')
      @rc.crawl
      @links  = []
      @writer = Write::Writer.new

      @rc.links.each do |link|
        if !@rc.urls.include? link
  	      crawler = RedCrawl.new(link)
  	      crawler.crawl
          @links<<crawler.links
        end
      end

      @links = @links.flatten
      @links = @links.uniq
      @writer.write_list('result.txt',@links)
      puts "Im Finished! with a total of #{@links.size} links gathered".bold.blue

    end
end

a = Sandbox.new


