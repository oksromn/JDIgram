Rails.application.routes.draw do
resources :profiles
root to: 'visitors#index'
devise_for :users
resources :users
end
