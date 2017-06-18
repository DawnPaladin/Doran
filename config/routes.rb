Rails.application.routes.draw do

  devise_for :users

  root 'angular#index'
  get 'angular/index'

  scope :api do
    scope :v1 do
      resources :champions, only: [:index]
      resources :rosters, only: [:show]
      resources :strengths
      resources :weaknesses
    end
  end

end
