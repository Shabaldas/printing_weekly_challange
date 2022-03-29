Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
    resources :users
    resources :challenges do
      delete :main_challenge_picture, on: :member, action: :destroy_main_challenge_picture
    end
    resources :challenge_members

    root to: 'users#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :challenges
  root 'static_pages#home', as: :home
end
