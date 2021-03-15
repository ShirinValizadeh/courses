# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :set_course, only: [:show]



  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show; end



  private


  def set_course
    @course = Course.find(params[:id])
  end



  def course_params
    params.require(:course).permit(:title, :description, :published , :image )
  end
end
