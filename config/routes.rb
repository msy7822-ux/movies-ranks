Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users

  root to: 'homes#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
