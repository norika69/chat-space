Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: :index
  resources :groups, only: [:new, :create, :edit, :update]
  root 'messages#index'
end
