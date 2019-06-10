Rails.application.routes.draw do
  resources :chats
  resources :profiles
  resources :homes

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'homes#index'
  resources :users do
    get :create_friend_request, on: :member
    get :destroy_friend_request, on: :member
    get :accept_friend_request, on: :member
    get :remove_friend, on: :member
    get :index_friends, on: :collection
    resources :chats
  end

  resources :posts do
    resources :likes
    resources :comments
  end

  resources :messages, only:[:create]
end
