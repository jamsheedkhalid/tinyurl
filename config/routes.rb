Rails.application.routes.draw do
  # get 'static_pages/home'
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :sessions, only: [:create]
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "logout" , to: "sessions#destroy"
  get "login", to: "sessions#new"
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
  resources :passwords, only: [ :new, :create, :edit, :update], param: :password_reset_token
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
  post "upload" , to: "uploads#create"
  get  "upload", to: "uploads#new"
  put "upload", to:"uploads#share"
  get "show_uploads", to: "uploads#show"
  resources :uploads, only: [ :destroy], param: :id

end