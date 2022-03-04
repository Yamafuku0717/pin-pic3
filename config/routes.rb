Rails.application.routes.draw do
  devise_for :users
  root to: 'pictures#index'
  resources :pictures do
    resources :my_lists, only: :create
    resources :memos, only: [:create, :show, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
    member do
      get 'user'
    end
    collection do
      get 'search'
    end
  end
end
