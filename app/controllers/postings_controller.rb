class PostingsController < ApplicationController


  # GET /postings
  # GET /postings.json
  def index
    @postings = Posting.all
  end



  private

    # Only allow a list of trusted parameters through.
    def posting_params
      params.require(:posting).permit(:title, :description)
    end
end
