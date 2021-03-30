class Courses::ReactionsController < ReactionsController
    before_action :set_reactionable

    private

    def set_reactionable
        @reactionable = Course.find(params[:course_id])
        
    end
end