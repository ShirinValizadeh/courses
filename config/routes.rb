# frozen_string_literal: true

Rails.application.routes.draw do
  
mount Blazer::Engine, at: "blazer"


namespace :api, constraints: { format: "json" }, defaults: { format: "json" } do
   resources :postings , only: [:create, :index, :show , :destroy , :update]
   # resources :courses

   resources :courses 

end

  
  




  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resource :about
  resource :contact
  resources :my_tasks
  resources :tasks
  devise_for :users

  # author_courses_url #index
  # author_course_url(@course) #show
  # /author/courses
  # /author/courses/:id
  namespace :author do
    resources :courses do
      resources :lessons
    end
  end

  namespace :admin do
    resources :postings 
  end

  

  # courses_url #index
  # course_url(@course) #show
  # /courses
  # /courses/:id
  resources :courses, only: %i[index show] do
    resources :comments , module: :courses
    resources :reactions , module: :courses
    resources :content_lessons, only: %i[show ]
    resource :teacher, only: %i[show ]
    resources :completedlessons    
    resources :lessons, only: %i[index show]
    resources :enrollments, only: [:create]
 end
 resources :postings 


 
  resources :finished_courses, only: %i[show ] 
  resources :course_ratings

  # config/routes.rb
 # get '/:locale' => 'dashboard#index'

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  
  #get 'about', to: 'about#index'

  
  root 'home#index'
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

