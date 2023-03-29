Rails.application.routes.draw do
  resources :payments
  resources :order_items
  resources :orders
  resources :items
  resources :users

  post 'users/login', to: 'users#login'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
