Rails.application.routes.draw do
  # get 'general_shopping_lists/index'
  devise_for :users
  root "foods#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users 
  resources :foods, except: [:edit, :update]
  resources :recipes do
    resources :recipe_foods, except: [:edit, :update]
    resources :general_shopping_lists, only: [:index]
  end
  resources :public_recipes, only: [:index]
  # Defines the root path route ("/")
  # root "articles#index"
end
