Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    authenticated :user do
      root 'pages#dashboard', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  get "dashboard", to: "pages#dashboard"
  get "about", to: "pages#about"
  get "upgrade", to: "pages#upgrade"

  resources :contacts, only: [:new, :create ] # new_contact_path /contacts/new

  get 'contacts/sent'

  resources :puzzles, only: %i[index show new create update]
  resources :habits, only: %i[show destroy]
  resources :users, only: %i[show edit update destroy]
  resources :goals do
    resources :habits, only: %i[new create]
  end

  resources :habits, only: [:update]
end
