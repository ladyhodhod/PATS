Rails.application.routes.draw do
  resources :owners
  resources :pets
  resources :animals
  resources :visits

  # get '/pets', to: 'pets#index'
  # get '/pets/:id', to: 'pets#show'
  # post '/pets', to: 'pets#create'

   # Semi-static page routes
   get 'home', to: 'home#index', as: :home
   get 'home/about', to: 'home#about', as: :about
   get 'home/contact', to: 'home#contact', as: :contact
   get 'home/privacy', to: 'home#privacy', as: :privacy
   get 'home/search', to: 'home#search', as: :search

  # Set the root url
  #  Next, we’ll tell Rails to look for that as the default root page.
  # root to: 'pets#index'#, as: :home
   root to: 'home#index'
  
end
