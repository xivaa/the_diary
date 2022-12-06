Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    authenticated :user do
      root 'pages#dashboard', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get "dashboard", to: "pages#dashboard"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :puzzles, only: %i[show new create update]
  resources :habits, only: %i[new create show destroy]
  resources :users, only: %i[show edit update destroy]
  resources :goals do
    resources :habits, only: %i[new create]
  end
end
