class PasswordResetsController < ApplicationController

def new
end

def create
    @user = User.find_by(email: params[:email])

    if @user.present?
        #send email
        PasswordMailer.with(user: @user).reset.deliver_now
    end 
    
    redirect_to root_path, notice:"if an account with that email was found"
    end


   def edit
       @user = User.find_signed!(params[:token], purpose: "password_reset")
   rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to user_session_path, notice: "your token has expired. pls try again"
   end     

   def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(pasword_params)
        redirect_to user_session_path, notice:"your password was reset successfully , pls sign in"
    else
        render :edit
   end
end    



private

    def pasword_params
        params.require(:user).permit(:password, :password_confirmation)
    
    end


end
