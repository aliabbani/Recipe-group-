Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  get 'foods/create'
  get 'foods/delete'
  devise_for :users
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users 

  # Defines the root path route ("/")
  # root "articles#index"
end
