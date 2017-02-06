Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/sup',   to: 'static_pages#sup'
  get    '/contact', to: 'static_pages#contact'
  get    '/pres',   to: 'static_pages#pres'
  get    '/pub',   to: 'static_pages#pub'  
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end