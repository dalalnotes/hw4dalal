Rails.application.routes.draw do
  root "places#index"

  resources :entries
  resources :places
  resources :users

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
