module Author
  class LessonsController < ApplicationController
    before_action :set_course 
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    def show
    end


    # GET /Lessens/new
    def new
      @lesson = Lesson.new
    end

    # POST /lesson
    # POST /lesson.json
    def create
      @lesson = Lesson.new(lesson_params)
      @lesson.course = @course

      if @lesson.save
        redirect_to author_courses_url, notice: 'Lesson was successfully created.'
      else
        render :new
      end
    end



    def edit
    end

    def update
      if @lesson.update(lesson_params)
        redirect_to author_courses_url, notice: 'Lesson was successfully updated.'
      else
        render :edit
      end
    end


  # DELETE /lesson/1
    # DELETE /lesson/1.json
    def destroy
      @lesson.destroy
      respond_to do |format|
        format.html { redirect_to author_courses_url, notice: 'Lesson was successfully destroyed.' }
        format.json { head :no_content }
      end
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
end