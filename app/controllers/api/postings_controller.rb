module Api
    class PostingsController < ApplicationController
        def index
            postings = Posting.order('created_at DESC')
            render json: {status: 'SUCCESS' , message:'Loaded postings',data:postings},status: :ok
        end

        def show
            posting = Posting.find(params[:id])
            render json: {status: 'SUCCESS' , message:'Loaded posting',data:posting},status: :ok
            
        end

        def creat
            posting = Posting.new(posting_params)

            if posting.save
            render json: {status: 'SUCCESS' , message:'Saved posting',data:posting},status: :ok
            else    
            render json: {status: 'ERROR' , message:'posting not saved',data:posting.errors},status: :unprocessable_entity

        end


        def destroy
            posting = Posting.find(params[:id])
            posting.destroy
            render json: {status: 'SUCCESS' , message:'DELETED posting',data:posting},status: :ok

        end

        def update
            posting = Posting.find(params[:id])
            if posting.update_attributes(posting_params)
            render json: {status: 'SUCCESS' , message:'Updated posting',data:posting},status: :ok
            else    
            render json: {status: 'ERROR' , message:'posting not updated',data:posting.errors},status: :unprocessable_entity
        end

        
        private

        def posting_params
            params.permit(:title , :description)
        end
    end
end