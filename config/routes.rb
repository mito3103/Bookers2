Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit]

  resources :books, only: [:new, :index, :show, :destroy]

  get 'homes/top'
  get 'homes/about'

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
