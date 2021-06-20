Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, param: :_username
      post '/login', to: 'authentication#login'
      get '/profile', to: 'users#profile'
    end
  end
end
