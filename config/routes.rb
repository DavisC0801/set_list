Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ways to add a landing page, as syntax adds a route helper
  root to: "welcome#index"
  # get "/", to: "weclome#index", as: "welcome"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
  end
  resources :songs, only: [:show, :index]
  resources :playlists, only: :index
  resources :users, only: [:new, :create, :show]

  # scope :admin, module: :admin, as: :admin do
  #   resources :categories, only: :index
  # end

  namespace :admin do
    resources :categories, only: :index
  end

  resources :carts, only: :create
end
