Rails.application.routes.draw do
  get 'chats/index'
  get 'chats/create'
  get 'chats/show'
  resources :profiles
  resources :homes

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'homes#index'
  resources :users do
    resources :chats
  end

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :messages, only:[:create]

end
