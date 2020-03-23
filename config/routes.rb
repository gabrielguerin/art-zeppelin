# frozen_string_literal: true

Rails.application.routes.draw do
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
  resources :blogs
  devise_for :users
  resources :projects
  resources :tags
  resources :artworks
  resources :artists
  resources :companies
  resources :clients

  root 'statics#show', page: 'index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
