# frozen_string_literal: true

class LessonsController < LoggedInController
  before_action :set_course
  before_action :set_lesson, only: [:show]
  before_action :check_enrollment

  def show
    @next_lesson = @course.next_lesson(@lesson)
    @previous_lesson = @course.previous_lesson(@lesson)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
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
    params.require(:lesson).permit(:title, :body)
  end
end
