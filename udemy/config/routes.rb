Rails.application.routes.draw do

  get 'mypage', to: 'users#me'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'home#index'
  resources :boards
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:new, :create]
end
