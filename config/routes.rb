Rails.application.routes.draw do
  resources :payments
  resources :order_items
  resources :orders
  resources :items, only: [:index, :show]
  resources :users

  post 'users/login', to: 'users#login'
  post 'users/signup', to: 'users#signup'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end