WhoRunIt::Application.routes.draw do

  # Sessions
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Root
  root to: 'events#new'

  # Events
  resources :events

  # Routes
  resources :routes
  post "/routes/remove", to: "routes#remove"

  # Users
  get  '/users/:id', to: 'users#show', as: '/profile'
  get  '/users',     to: 'users#new'
  post '/users',     to: 'users#create'

  # Notifications
  post "/commit", to: "notifications#commit"

  # LocationSettings
  resources :location_settings
end
