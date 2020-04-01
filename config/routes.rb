Rails.application.routes.draw do
  devise_for :users
  root "images#index"
  resources :images, only:[:index, :new]
  get '/images', to: 'images#show'
  post '/images/create', to: 'images#create'
end
