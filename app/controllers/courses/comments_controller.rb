class Courses::CommentsController < CommentsController
    before_action :set_commentable

 
    private

    def set_commentable
        @commentable = Course.find(params[:course_id])        
    end
end