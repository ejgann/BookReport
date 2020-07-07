Rails.application.routes.draw do
  root 'sessions#home'
  

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


  resources :users
  resources :reviews
  resources :books do
    resources :reviews, shallow: true 
    end

end
