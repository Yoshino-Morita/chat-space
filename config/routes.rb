Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :messages
  resources :users, only: [:delete, :create, :edit, :update]
  resources :groups, only: [:index, :create, :edit, :update, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
