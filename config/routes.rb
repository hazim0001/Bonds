Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'pages#home'
  devise_scope :user do
    root to: 'assets#index'
  end

  resources :assets, only: :index do
    resources :bonds, only: %i[index]
    resources :cashes, only: %i[index]
    resources :properties, only: %i[index]
    resources :stocks, only: %i[index]
  end

  resources :bonds, except: %i[index]
  resources :cashes, except: %i[index]
  resources :properties, except: %i[index]
  resources :stocks, except: %i[index]
end
