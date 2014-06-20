#!/usr/bin/ruby 

=begin
  This webcrawler will gather all links withing a single HTML file
=end
	

require 'open-uri'
require_relative 'write'
require 'colored'

puts "Starting to Crawl websites".bold.blue

class RedCrawl
   attr_accessor :links,:urls
def initialize(url)
	@urls = [url]
	@links = []
	
end

# Should add smart link processing

def process(body)
	
  # Find the first href text
	start_position = body.index("href")
	if start_position.nil?
		return ['','']
	end

	body = body[start_position+1,body.size]
   
	quote_1 = body.index("\"")
  if quote_1.nil?
    return ['','']
  end

	body = body[quote_1+1,body.size]

	quote_2 = body.index("\"",quote_1+1)
	link_preview = body[0,quote_2]


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

	def initialize(url)
	  @rc = RedCrawl.new(url)
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

puts "Opening: #{ARGV[0]}"
exit if ARGV.size < 1 
a = Sandbox.new(ARGV[0])



