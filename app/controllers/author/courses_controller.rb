module Author
  class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user! ,except: [:show , :index]   #check if user ist login
    before_action :correct_user, only: [:edit , :update , :destroy]  #check if ist currect user


    # GET /courses
    # GET /courses.json
    def index
      @courses = Course.all
    end

    # GET /courses/1
    def show
    end

    # GET /courses/new
    def new
      #@course = Course.new
      @course = current_user.courses.build
    end

    # GET /courses/1/edit
    def edit
    end

    # POST /courses
    def create
     # @course = Course.new(course_params)
     @course = current_user.courses.build(course_params)
      @course.user = current_user
      respond_to do |format|
        if @course.save
          format.html { redirect_to author_courses_url, notice: 'Course was successfully created.' }
    
        else
          format.html { render :new }

        end
      end
    end

    # PATCH/PUT /courses/1
    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to author_courses_url, notice: 'Course was successfully updated.' }
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


    def correct_user
      @course = current_user.courses.find_by(id: params[:id])
      redirect_to courses_path , notice: "Not Authorized To Edit This Course " if @course.nil? 
    end






    private

      
      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def course_params
        params.require(:course).permit(:title, :description, :published )
      end
  end
end