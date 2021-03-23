module Api
    #module Admin

    class PostingsController <  ApplicationController
        
        before_action :set_posting, only: %i[show edit update] 
        respond_to :json
        skip_before_action :verify_authenticity_token


        def index
            #postings = Posting.order('created_at DESC')
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
            if @posting.update_attributes(posting_params)
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
            params.permit(:title , :description)
        end
            
    end


   # end

end