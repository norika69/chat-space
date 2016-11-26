Rails.application.routes.draw do
  
  root 'groups#index'
  devise_for :users
  resources :messages, only: :index

  resources :groups do
    member do
      get 'group'
      get 'message'
    end
  end
   
end
