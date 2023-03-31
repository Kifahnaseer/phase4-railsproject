Rails.application.routes.draw do

  resources :payments, only: [:new, :create]
  
  resources :user_names
  #resources :payments
  resources :order_items
  resources :orders
  resources :items, only: [:index, :show]
  resources :users

  post 'users/login', to: 'users#login'
  post 'users/signup', to: 'users#signup'
  delete 'users/logout', to: 'users#destroy'

  get '/orders', to: 'orders#index'
  get '/orders/:id', to: 'orders#show'
  post '/orders/create', to: 'orders#create'
  delete '/orders/delete/:id', to: 'orders#destroy'

 

 



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end