class ReactionsController < ApplicationController
    
    def create
        
        @reaction = @reactionable.reactions.new(reaction_params)
        @reaction.user = current_user
        @reaction.save
        redirect_to @reactionable, notice:"your reaction was successfully"
    end


    private

    def reaction_params
        params.require(:reaction).permit(:reaction)
    end
end