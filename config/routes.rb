Rails.application.routes.draw do
  root 'home#index'
  resources :departments
  resources :profiles, except: [:new, :create]
  devise_for :users
  resources :users, except: [:show, :index]
  resources :teams
  get 'invitation_user', to: 'profiles#invitation_user'
end
