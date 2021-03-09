class TeachersController < ApplicationController

    before_action :set_course


    def show
        @author = @course.user

    end    


    private
    def set_course
      @course = Course.find(params[:course_id])
    end
end    


