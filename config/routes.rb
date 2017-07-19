Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: [:index, :create, :edit, :update, :new] do
  resources :messages, only: [:index, :create]
  end
  resources :users, only: [:index, :delete, :create, :edit, :update]
end
