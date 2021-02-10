# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'password' }
    encrypted_password { User.new.send(:password_digest, 'password') }

    factory :author do
      author { true }
    end


    factory :admin do
      admin { true }
    end
    
  end
end
