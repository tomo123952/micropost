Rails.application.routes.draw do 
  get 'microposts/create'
  get 'microposts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only:[:index, :show, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  
  
  resources :microposts, only:[:create, :destroy]
  resources :relationships, only:[:create, :destroy]
  resources :favorites, only:[:create, :destroy]
end