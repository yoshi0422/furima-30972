Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:edit, :update]
  devise_for :users
end
