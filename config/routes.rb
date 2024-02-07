Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'movies', to: 'movies#popular'
  get 'movies/:id', to: 'movies#detail'
  get 'search', to: 'movies#search'

  get 'profile', to: 'movie_records#index'

  post 'add_movie', to: 'movie_records#create'
  post 'remove_movie', to: 'movie_records#destroy'
  patch 'update_movie', to: 'movie_records#update'

  # Defines the root path route ("/")
  root "movies#popular"
end
