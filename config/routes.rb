Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
  resources :orders, only: [:index, :create]
end