Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :puzzles, only: %i[new create update]
  resources :users, only: %i[show edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :goals do
    resources :habits, only: %i[new create destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :goals, only: %i[destroy]
end
