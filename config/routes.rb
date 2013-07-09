WhoRunIt::Application.routes.draw do

  # Sessions
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Root
  root to: 'events#new'

  # Events
  resources :events



  # Users
  resources :users

  get "/profile", to: 'users#show'

  # Notifications
  post "/commit", to: "notifications#commit"

  # LocationSettings
  resources :location_settings
end
