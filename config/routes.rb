Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :destroy]
      resources :ingredients, only: [:index]
      resources :user_ingredients, only: [:create, :destroy]
      post '/login', to: 'authentication#login'
      get '/login', to: 'authentication#user'
      get '/usernames', to: 'users#usernames'
      get '/profile', to: 'users#profile'
    end
  end
end
