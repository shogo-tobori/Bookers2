Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  resources :books, only: [:new, :index, :show, :edit, :create, :top, :destroy]

  resources :users, only: [:new, :index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
