Rails.application.routes.draw do
  resources :owners
  resources :pets
  resources :animals
  resources :visits

  # get '/pets', to: 'pets#index'
  # get '/pets/:id', to: 'pets#show'
  # post '/pets', to: 'pets#create'
  
end
