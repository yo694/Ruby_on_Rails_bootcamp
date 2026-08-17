Rails.application.routes.draw do
  devise_for :users
  resources :publishers

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Home Page
  get "hello", to: "home#hello"

  get "/books", to: "books#index"

  get "/books/http_cache_demo", to: "books#http_cache_demo"

  get "/books/stimulus_demo", to: "books#stimulus_demo"

  # Books
  resources :books do

    # Nested Routes
    resources :reviews

    # Member Route
    member do
      get :publish
    end

    # Collection Routes
    collection do
      get :search
      get :query_demo
    end
  end

  # Singular Resource
  resource :profile

  # Admin Namespace
  namespace :admin do
    resources :books do
      collection do
        get :books_with_reviews
      end
    end
  end

  # Authors
  scope "/library" do
    resources :authors
  end

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create,:destroy]
      get "books/bad_request_demo", to: "books#bad_request_demo"
      post "auth/login", to: "auth#login"
    end
  end

end