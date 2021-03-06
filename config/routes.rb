Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  resources :owners
  resources :pets
  resources :animals
  resources :visits

  # resources :users, only: [:new, :create]
  # OR
  get 'signup', to: 'users#new', as: :user
  post '/users', to: 'users#create'

  # resources :sessions, only: [:new, :create, :destroy]
# OR
  get 'login', to: 'sessions#new' # a login form
  post '/sessions', to: 'sessions#create' # the login action itself
  get 'logout', to: 'sessions#destroy' # the logout

  get 'search', to: 'home#search'



  # # get '/pets', to: 'pets#index'
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
