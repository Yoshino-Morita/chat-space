Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :messages
  resources :users, only: [:delete, :create, :edit, :update]
  resources :groups, only: [:create, :edit, :update, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
