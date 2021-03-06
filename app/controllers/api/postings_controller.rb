module Api
  # module Admin

  class PostingsController < BaseController
    before_action :set_posting, only: %i[show edit update destroy]
    respond_to :json

    def index
      # postings = Posting.order('created_at DESC')
      @postings = Posting.all
    end

    def show
      render :show
    end

    def create
      @posting = Posting.new(posting_params)
      if @posting.save
        render :show
      else
        render json: @posting.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @posting.destroy
      head :no_content
    end

    def update
      if @posting.update(posting_params)
        render :show
      else
        render json: @posting.errors, status: :unprocessable_entity
      end
    end

    private

    def set_posting
      @posting = Posting.find(params[:id])
    end

    def posting_params
      params.require(:posting).permit(:title, :body)
    end
  end

  # end
end
