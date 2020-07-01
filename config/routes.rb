Rails.application.routes.draw do
  root 'sessions#home'
  

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'


  resources :users do
      resources :reviews, shallow: true
    end
  resources :books 
  resources :reviews

end
