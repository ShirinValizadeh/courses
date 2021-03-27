module Api
  class CoursesController < ApplicationController
    respond_to :json
    before_action :set_course, only: %i[show edit update destroy]
 


    def index
      @courses = Course.all
    end



  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :body, :description ,:published , :image)
  end


  end
end
