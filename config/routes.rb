Rails.application.routes.draw do

  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root 'startups#index'
  resources :startups
end
