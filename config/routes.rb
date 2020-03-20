Rails.application.routes.draw do
  resources :blogs
  devise_for :users
  resources :projects
  resources :tags
  resources :artworks
  resources :artists
  resources :companies
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
