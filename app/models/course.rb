class Course < ApplicationRecord
    has_many :lessons

    def hi
    puts "Hi"
    end

   def self.hello
    puts "Hello"
   end
end



