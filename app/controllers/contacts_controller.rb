

class ContactsController < ApplicationController
 # require 'mail_form'


    def new
      @contact = Contact.new
    end


       # POST /contact
       def create
        @contact = Contact.new(contact_params)
      
          if @contact.save
           redirect_to root_url, notice: 'contact was successfully .' 
  
          else
            render :new 
  
          end
      end




      private


      # Only allow a list of trusted parameters through.
      def contact_params
        params.require(:contact).permit(:email, :subject, :description)
      end
    end