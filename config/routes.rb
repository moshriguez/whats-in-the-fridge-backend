Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'authentication#login'
      get '/login', to: 'authentication#user'
      post '/users', to: 'users#create'
      get '/profile', to: 'users#profile'
    end
  end
end
