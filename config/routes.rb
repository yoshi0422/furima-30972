Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  root to:"order#index"
  resources :orders, only:[:create]
end
