Rails.application.routes.draw do
  resources :profiles
  resources :homes
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'homes#index'
  resources :users, only: [:show, :edit, :update]
end
