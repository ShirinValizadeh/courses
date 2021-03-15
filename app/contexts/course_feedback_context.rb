
class CourseFeedbackContext < ApplicationContext


def average_rating
  CourseFeedbackContext.all.average(:rating).to_i
end
       
end

#(@course_rating.rating.reduce(:+).to_f / @course_rating.rating.size).round(1)