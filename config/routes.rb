Rails.application.routes.draw do
  devise_for :users
  resources :items
  root to: "items#index"
  resources :items, only: [:edit, :update, :show] 


end