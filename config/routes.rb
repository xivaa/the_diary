Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#dashboard', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # root to: "new_user_session_path" # "pages#home"
  get "dashboard", to: "pages#dashboard"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :puzzles, only: %i[new create update]
  resources :habits, only: %i[new create show destroy]
  resources :users, only: %i[show edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :goals do
    resources :habits, only: %i[new create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :goals, only: %i[destroy]
end
