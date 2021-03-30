class ReactionsController < ApplicationController
    
    def create
        puts @reactionable
        @reaction = @reactionable.reactions.new(reaction_params)
        @reaction.user_id = current_user
        @reaction.save
        redirect_to @reactionable, notice:"your reaction was successfully"
    end


    private

    def reaction_params
        params.require(:reaction).permit(:reaction)
    end
end