Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'pages#home'
  devise_scope :user do
    root to: 'assets#index'
  end

  resources :assets, only: :index do
    resources :bonds, only: %i[index create]
    resources :cashes, only: %i[index create]
    resources :properties, only: %i[index create]
    resources :stocks, only: %i[index create]
  end

  resources :bonds, except: %i[index create]
  resources :cashes, except: %i[index create]
  resources :properties, except: %i[index create]
  resources :stocks, except: %i[index create]
end
