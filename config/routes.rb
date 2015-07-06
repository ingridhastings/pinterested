Rails.application.routes.draw do
  resources :pins
  root 'pins#index'
  get 'home/about'
  get 'home/contact'
  get 'home/faq'

  get '/login' => 'sessions#new', as: :signin
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :destroy_user

  get '/signup' => 'users#new', as: :new_user
  post '/users' => 'users#create'


end
