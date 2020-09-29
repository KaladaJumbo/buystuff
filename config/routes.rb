Rails.application.routes.draw do
  resources :shoppers
  resources :orders
  resources :order_items
  resources :items
  resources :customers
  get "/welcome", to: "order_items#welcome", as: "welcome"
  get "/", to: "order_items#homepage", as: "root"
  get "/login", to: "customers#login"
  post "/login", to: "customers#post_login"
  get "/shoppers_login", to: "shoppers#login", as: "shopper_login"
  post "/shoppers_login", to: "shoppers#post_login" 
  get "/logout", to: "customers#logout", as: "logout"
  get "/shoppers_logout", to: "shoppers#logout", as: "shopper_logout"
  get "/shoppers_welcome", to: "shoppers#welcome", as: "shopper_welcome"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
