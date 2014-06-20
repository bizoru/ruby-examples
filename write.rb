#!/usr/bin/ruby

module Write
class Writer
  def write_list(filename,list)
  	f = File.open(filename,"w")
    list.each do |item|
    	f.puts item
    end
    f.close
  end
end
end
