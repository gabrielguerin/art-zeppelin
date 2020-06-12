# frozen_string_literal: true

Rails.application.routes.draw do
  # Admin routes

  namespace :admin do
    resources :users

    resources :artists

    resources :artists_tags

    resources :artworks

    resources :artworks_tags

    resources :blogs

    resources :blogs_tags

    resources :clients

    resources :companies

    resources :projects

    resources :projects_tags

    resources :tags

    root to: 'users#index'
  end

  # Blogs routes

  resources :blogs, only: %i[index show], path: 'blog'

  # Devise routes

  devise_for :users

  # Projects routes

  resources :projects

  # Tags routes

  resources :tags

  # Artworks routes

  resources :artworks

  # Artists routes

  resources :artists

  # Companies routes

  resources :companies

  # Clients routes

  resources :clients

  # Statics routes

  root 'statics#show', page: 'home'

  get '/:page', to: 'statics#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
