Rails.application.routes.draw do
  root 'posts#index'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
  get 'posts/index', to: 'posts#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
end
