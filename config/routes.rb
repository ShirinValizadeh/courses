# frozen_string_literal: true

Rails.application.routes.draw do
  
  
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

  resource :admin do
    resources :postings
  end


  # courses_url #index
  # course_url(@course) #show
  # /courses
  # /courses/:id
  resources :courses, only: %i[index show] do
    resources :lessons, only: %i[index show]
    resources :enrollments, only: [:create]
 end
  resources :postings, only: %i[index ] 

 

  get 'about', to: 'about#index'
  resource :contact

  root 'home#index'
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
