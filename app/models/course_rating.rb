class CourseRating < ApplicationRecord
  belongs_to :course

  def blank_stars
    5 - rating.to_i
   end
end
