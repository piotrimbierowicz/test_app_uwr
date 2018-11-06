require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :posts, only: %i[index show]

  resources :comments, only: [:create] do
    member do
      get :report
    end
  end

  resources :course_editions, only: [:index] do
    member do
      get :add_to_cart
    end
  end

  resources :carts, only: [:index]

  namespace :user_panel, path: 'user' do
    root to: 'profile#index'
  end

  mount Sidekiq::Web => '/sidekiq'
end
