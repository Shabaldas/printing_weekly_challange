Rails.application.routes.draw do
  devise_for :users
  
  namespace :admin do
      resources :users
      resources :challenges
      resources :challenge_members

      root to: 'users#index'
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home', as: :home
end
