Rails.application.routes.draw do
  
  devise_for :users
   devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'groups#index'

  resources :groups do
    member do
    resources :messages
    end
  end
   
end
