Rails.application.routes.draw do
  devise_for :users
  root "pctures#index"
  resources :pctures, only:[:index, :new, :show]
  get '/pctures', to: 'pctures#show'
  post '/pctures/create', to: 'pctures#create'
end
