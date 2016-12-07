Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  get 'users/search' => 'users#search'
   devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :groups do
    member do
    resources :messages, only: [:create]
    end
  end
   
end
 
