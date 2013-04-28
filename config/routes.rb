Chsdesk::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  resources :articles
  resources :tenants 
  resources :tenant_imports
    
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

      
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  root to: 'static_pages#home'

    match '/users/search' => 'users#search',  :requirements => { :method => :get }
    resources :users do 
      member do 
        put :suspend
        put :unsuspend
        put :activate
        delete :purge
        put :reset_password
        get :set_user_login
        get :set_user_email
        get :invite
        match 'role/:role' => "users#toggle_role", :as => "toggle_role"
      end
      collection do
        get :pending
        get :active
        get :suspended
        get :deleted
      end
    end

end
