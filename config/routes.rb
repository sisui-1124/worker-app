Rails.application.routes.draw do
  devise_for :users
  root "workers#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
end
