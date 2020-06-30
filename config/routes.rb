Rails.application.routes.draw do
  root 'sessions#home'
  
  # signup
  get '/signup', to: 'users#new'

  # login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # logout
  delete '/logout', to: 'sessions#destroy'


  resources :reviews
  resources :books
  resources :users

end
