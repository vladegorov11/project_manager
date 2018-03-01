Rails.application.routes.draw do
  
  root 'home#index'
  resources :departments
  resources :profiles, except: [:new, :create] do
    get 'my_tasks', to: 'profiles#my_tasks', on: :member
  end
  devise_for :users
  resources :users, except: [:show, :index]
  resources :teams do 
  	resources :tasks, except: [:index] do 
      resources :comments
  		member do
    		get 'performed', to: 'tasks#performed'
    		get 'done', to: 'tasks#done'
        get 'remake', to: 'tasks#remake'
  		end
  	end
  end
  get 'invitation_user', to: 'profiles#invitation_user'
end
