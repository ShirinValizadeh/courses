class CourseRatingsController < ApplicationController
  before_action :set_course_rating, only: %i[ show edit update destroy ]
  before_action :set_course


  def index
    @course_ratings = CourseRating.all
  end


  def show
  end

  def new
    @course_rating = CourseRating.new
  end


  def edit
  end


  def create
    @course_rating = CourseRating.new(course_rating_params)
      if @course_rating.save     

        redirect_to @course, notice: "Course rating was successfully created."   
      else
        render :new   
    end
  end

  
  def update
      if @course_rating.update(course_rating_params)
     redirect_to @course, notice: "Course rating was successfully updated."     
      else
       render :edit 
 
    end
  end

  # DELETE /course_ratings/1 or /course_ratings/1.json
  def destroy
    @course_rating.destroy
    respond_to do |format|
    redirect_to course_ratings_url, notice: "Course rating was successfully destroyed." 

    end
  end

  private

    def set_course_rating
      @course_rating = CourseRating.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:id])
    end

   
    def course_rating_params
      params.require(:course_rating).permit(:course_id, :rating)
    end
end
