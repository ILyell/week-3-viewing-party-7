Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  # get '/users/:id/movies', to: 'movies#index', as: 'movies'
  # get '/users/:user_id/movies/:id', to: 'movies#show', as: 'movie'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  get '/dashboard', to: 'users#show'
  get '/viewing_parties', to: 'users#create_viewing_party'

  get '/logout', to: 'users#logout'
  resources :users, only: :show
  resources :movies, only: [:index, :show]
end
