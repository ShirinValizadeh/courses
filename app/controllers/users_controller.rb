    #     @user = User.new(params[:user])
    
    #     respond_to do |format|
    #       if @user.save
    #         # Tell the UserMailer to send a welcome email after save
    #         UserMailer.with(user: @user).welcome_email.deliver_later
    
    #       redirect_to(@user, notice: 'User was successfully created.') 
    
    #       else
    #          render action: 'new' 
     
    #       end
    #     end