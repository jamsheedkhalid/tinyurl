Rails.application.routes.draw do
  # get 'static_pages/home'
  root "static_pages#home"
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
end
