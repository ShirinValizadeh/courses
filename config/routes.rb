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

  
  # courses_url #index
  # course_url(@course) #show
  # /courses
  # /courses/:id
    resources :courses, only: [:index, :show] do
     resources :lessons, only: [:index, :show]
  end


  get 'home/about'
  root 'home#index'
  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
