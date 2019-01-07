Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      post '/users', to: 'users#create'
      get '/gifs', to: 'gifs#show'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
    end
  end
end
