Rails.application.routes.draw do

  resources :users, only: [:show, :edit]

  resources :books, only: [:new, :index, :show, :destroy]

  get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
