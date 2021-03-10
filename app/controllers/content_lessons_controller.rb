class ContentLessonsController < ApplicationController

    before_action :set_course
    before_action :set_lesson, only: [:show]
    before_action :check_enrollment


def show
   
end



private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  end

  def check_enrollment
    redirect_to course_url(@course), notice: 'you are not enrolled yet' unless @course.enrolled?(current_user)
  end

  def lesson_params
    params.require(:lesson).permit(:title, :body  )
  end
end