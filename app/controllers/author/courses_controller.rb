# frozen_string_literal: true

module Author
  class CoursesController < BaseController
    before_action :set_course, only: %i[show edit update destroy]

  


    # GET /courses
    # GET /courses.json
    def index
      @courses = Course.all
    end

    # GET /courses/1
    def show; end

    # GET /courses/new
    def new
      # @course = Course.new
      @course = current_user.courses.build
    end

    # GET /courses/1/edit
    def edit; end

    # POST /courses
    def create
      # @course = Course.new(course_params)
      @course = current_user.courses.build(course_params)
      @course.user = current_user
        if @course.save
         
         redirect_to author_courses_url, notice: 'Course was successfully created.'
        else
         render :new    
      end
    end

    # PATCH/PUT /courses/1
    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to author_course_url, notice: 'Course was successfully updated.' }
        else
          format.html { render :edit }

        end
      end
    end

    # DELETE /courses/1
    def destroy
      @course.destroy
      respond_to do |format|
        format.html { redirect_to author_courses_url, notice: 'Course was successfully destroyed.' }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_user.courses.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :body, :description ,:published , :image)
    end
  end
end
