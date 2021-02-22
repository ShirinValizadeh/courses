class CompletedlessonsController < ApplicationController
  before_action :set_completedlesson, only: [:destroy]
  before_action :set_course
  before_action :set_lesson
  before_action :check_enrollment

  


  # POST /completedlessons
  def create

    if @course.last_lesson?(@lesson)
      if !Completedlesson.find_by(user: current_user, lesson: @lesson , course: @course)
          Completedlesson.create!(user: current_user, lesson: @lesson,  course: @course)
    end  
     
          redirect_to finished_course_url(@course)
  
   else
       if !Completedlesson.find_by(user: current_user, lesson: @lesson , course: @course)
           Completedlesson.create!(user: current_user, lesson: @lesson,  course: @course)
       end   
          redirect_to course_lesson_url(@course, @course.next_lesson(@lesson))     
    end  

  end




  # DELETE /completedlessons/1
  def destroy
    @completedlesson.destroy
      redirect_to completedlessons_url, notice: 'Completedlesson was successfully destroyed.' 
    end
 


  private
   
    def set_completedlesson
      @completedlesson = current_user.completedlesson.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end


    def check_enrollment
      redirect_to course_url(@course), notice: 'you are not enrolled yet' unless @course.enrolled?(current_user)
    end

    def set_lesson
      @lesson = @course.lessons.find(params[:lesson_id])
    end

end
