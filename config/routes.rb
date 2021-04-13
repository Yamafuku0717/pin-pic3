Rails.application.routes.draw do
  devise_for :users
  root to: 'pictures#index'
  resources :pictures do
    resources :memos, only: [:create, :show, :edit, :update, :destroy]
    member do
      get 'user'
    end
    collection do
      get 'search'
    end
  end
end
