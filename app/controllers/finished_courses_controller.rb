class FinishedCoursesController < ApplicationController
    before_action :set_course, only: [:show]
    before_action :set_course_rating, only: %i[ show  ]


    def show   
        
    end
    



  private

  def set_course_rating
    @course_rating = CourseRating.find(params[:id])
  end


  def set_course
    @course = Course.find(params[:id])
  end

end