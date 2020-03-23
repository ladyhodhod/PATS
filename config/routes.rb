Rails.application.routes.draw do

  resources :owners
  resources :pets
  resources :animals
  resources :visits

  # get '/pets', to: 'pets#index'
  # get '/pets/:id', to: 'pets#show'
  # post '/pets', to: 'pets#create'

  get '/home', to: 'home#index', as: :home
  get '/home/about', to: 'home#about'
  get '/home/contact', to: 'home#contact'
  get '/home/privacy', to: 'home#privacy'
  
  root to: 'pets#index', as: :home1 # as if you are doing this: get '/' to: 'home#index'
  
end
