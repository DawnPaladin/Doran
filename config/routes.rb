Rails.application.routes.draw do

  devise_for :users

  resources :champions, only: [:index]
  resources :rosters, only: [:show]

  root to: 'champions#index'

end
