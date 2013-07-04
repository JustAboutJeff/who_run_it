WhoRunIt::Application.routes.draw do
  # Root
  root to: 'users#new'
  
  # Users
  resources :users
  # Events
  resources :events
  # Sessions
  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new'
  match '/login',   to: 'sessions#new'
  match '/profile', to: 'users#show'
  match '/logout',  to: 'sessions#destroy'
end
