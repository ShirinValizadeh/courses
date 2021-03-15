class CourseRatingsController < ApplicationController
 
  before_action :set_course



 

  def create
    @course_rating = CourseRating.new(course_rating_params)
      if @course_rating.save     

        redirect_to @course, notice: "Course rating was successfully created."   
      else
        render :new   
    end
  end

  


  private

    

    def set_course
      @course = Course.find(course_rating_params[:course_id])
    end

   
    def course_rating_params
      params.require(:course_rating).permit(:course_id, :rating)
    end
end
