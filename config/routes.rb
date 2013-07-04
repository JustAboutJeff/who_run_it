WhoRunIt::Application.routes.draw do
  # Root
  root to: 'users#new'
  
  # Users
  resources :users
end
