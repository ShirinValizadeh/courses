class Contact < ApplicationRecord

    # include MailForm::Delivery

    # attributes :email, :subject, :description, :format
    
    # def headers
    #     {
    #         :to => "shvalizadeh2020@gmail.com",
    #         :subject => "user created an account",
    #         :form => %("#{email} <#{description}> ")
    #     }
        
    # end
    validates :email, presence: true
    validates :subject,length: { maximum: 200 }


end
