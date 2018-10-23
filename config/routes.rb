Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'

  resources :posts, only: [:index, :show]

  resources :comments

  namespace :user do
    root to: 'profile#index'
  end

end
