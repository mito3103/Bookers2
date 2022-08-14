Rails.application.routes.draw do

  devise_for :users
  #devise_scope :user do
  #patch 'update',to: 'devise/registration#update',as: :users


  resources :users, only: [:show, :edit, :index, :update]
  post '/users/:id/edit' => 'users#edit'



  resources :books, only: [:new, :index, :show, :destroy, :edit, :update]
  post 'books/' => 'books#create'


  get 'home/' => 'homes#top'
  get 'home/about' =>'homes#about'

  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
