Rails.application.routes.draw do
  devise_for :users
  get 'workers/index'
  root to: "workers#index"

  resources :workers, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
  resources :users, only: :show
end