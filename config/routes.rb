Rails.application.routes.draw do

  #user
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
   }
  resources :users, :only => [:show, :index]
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?

  root 'startups#index'

  resources :startups do
    resources :comments
  end

  resources :relationships, only: [:create,:show,:destroy]

  resources :favorites, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

end
