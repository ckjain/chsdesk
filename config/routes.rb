Chsdesk::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  resources :articles
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

      
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  root to: 'static_pages#home'

end
