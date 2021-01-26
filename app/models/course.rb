class Course < ApplicationRecord
  has_many :lessons

  def hi
    puts add(5, 1)
    puts 'Hi'
  end

  def self.hello
    puts 'Hello'
  end

  private 

  def add(x, y)
    x + y
  end
end

course = Course.first
course.hi
# course.add(5, 1)


class SortArray

    def sort(array)
        quick_sort(array)
    end

    private

    def merge_sort(array)
        # actual merge sort implemention
    end

    def quick_sort(array)
        # implelet
    end
end

SortArray.new.sort([1, 2, 3])

#SortArray.new.merge_sort([1, 2, 3])