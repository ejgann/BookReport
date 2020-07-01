Rails.application.routes.draw do
  root 'sessions#home'
  
  # signup
  get '/signup', to: 'users#new'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # logout
  delete '/logout', to: 'sessions#destroy'


  resources :users do
      resources :reviews
    end
  resources :books do
      resources :reviews
    end
  resources :reviews

end
