class CourseRating < ApplicationRecord
  belongs_to :course
  #validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  
  def blank_stars
    5 - rating.to_i
   end
end
