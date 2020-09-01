Rails.application.routes.draw do
  devise_for :users
  root "workers#index"
  resources :users, only: [:edit, :update]
end
