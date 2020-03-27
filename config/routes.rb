Rails.application.routes.draw do

  resources :owners
  resources :pets
  resources :animals
  resources :visits

  # get '/pets', to: 'pets#index'
  # get '/pets/:id', to: 'pets#show'
  # post '/pets', to: 'pets#create'

  # Alias is used to rename  the path AND helper methods, then you do:
  get '/home', to: 'home#index', as: :home 
  get '/home/about', to: 'home#about', as: :about #-> this generates a helper named about_path 
  # this creates the following route:
  # about_path	 GET	   /home/about(.:format)	  home#about
  # Without the alias
  # get '/home/about', to: 'home#about'#-> this generates a helper named home_about_path 
  # home_about_path	 GET	   /home/about(.:format)	  home#about

  get '/home/contact', to: 'home#contact', as: :contact
  get '/home/privacy', to: 'home#privacy', as: :privacy
  
  # Set the root url
  #  We tell Rails to look for that as the default root page.
  root to: 'home#index' # as if you are doing this: get '/' to: 'home#index'
  
end
