Rails.application.routes.draw do
  resources :customers
  resources :admin_users
  resource :api_users, only: [:create]
  
  post "/api/login", to: "api_users#login"
  get "/api/auto_login", to: "api_users#auto_login"
  
  get 'admin_login', to: 'admin_sessions#new'
  post 'admin_login', to: 'admin_sessions#create'
  get 'admin_logout', to: 'admin_sessions#admin_logout'
  
  get 'overview', to: 'admin#overview'

  root 'admin#overview'
end
