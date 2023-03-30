Rails.application.routes.draw do
  resources :user_names
  resources :payments
  resources :order_items
  resources :orders
  resources :items, only: [:index, :show]
  resources :users
  get 'password/reset', to:'password_reset#new'
  post 'password/reset', to:'password_reset'

  post 'users/login', to: 'users#login'
  post 'users/signup', to: 'users#signup'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end