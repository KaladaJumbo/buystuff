Rails.application.routes.draw do
  resources :shoppers
  resources :orders
  resources :order_items
  resources :items
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
