class LessonsController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  end

  def edit
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])

    if @lesson.update(lesson_params)
      redirect_to @course, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description)
  end
end
