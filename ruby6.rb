#!/usr/bin/ruby

module Ruby6
  class Intelligence
  	 attr_accessor :container
     def sayHello
     	''
     end
     def heartbeat
     	sleep 1
     	puts "#{@container} #{self.object_id}"      
     end




  end
end 