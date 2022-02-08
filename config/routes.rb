Rails.application.routes.draw do
  devise_for :users
  root "foods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users 
  resources :foods, except: [:edit, :update]
end
