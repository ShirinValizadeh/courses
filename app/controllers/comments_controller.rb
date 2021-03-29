class CommentsController < ApplicationControler
    before_action :authentication_user

    def create
        @comment = @commentable.comments.new comment_params
        @comment.user = current_user
        @comment.save
        redirect_to @commentable, notice:"your camment was successfully"
        
    end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
