Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
   }
  resources :users, :only => [:show, :index]
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root 'startups#index'
  resources :startups
  resources :relationships, only: [:create, :destroy]

end
