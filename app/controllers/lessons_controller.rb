class LessonsController < ApplicationController
  before_action :set_course
  before_action :set_lesson, only: [:show]

  def show
  end


  private

   # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_lesson
    @lesson = @course.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :body)
  end

end