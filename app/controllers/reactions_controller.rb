class ReactionsController < ApplicationController
    
    def create
        @reaction = @reactionable.reactionss.new(reaction_params)
        @reaction.user_id = current_user
        @reaction.save
        redirect_to @reactionable, notice:"your reaction was successfully"
    end


    private

    def reaction_params
        params.require(:reactin).permit(:reaction)
    end
end