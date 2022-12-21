Rails.application.routes.draw do
  # Для запуска Resque сервера
  # require 'resque/server'
  # mount Resque::Server, at: '/jobs'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth" }

  root "events#index"
  
  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]

    post :show, on: :member
  end

  resources :users, only: [:show, :edit, :update, :destroy, :create]
end
