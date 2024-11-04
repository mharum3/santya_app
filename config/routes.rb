Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show] 
  root 'tweets#index'
  resources :tweets do 
    resources:likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]

  resources :maps, only: [:index]

end
