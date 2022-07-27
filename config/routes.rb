Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :edit]
  post '/users/:id/edit' => 'users#edit'


  resources :books, only: [:new, :index, :show, :destroy, :edit]
  post 'books/' => 'books#create'

  get 'homes/top'
  get 'homes/about'

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
