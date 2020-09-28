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
  get "/shopper_login", to: "shopper#login", as: "shopper_login"
  get "/logout", to: "customers#logout", as: "logout"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
