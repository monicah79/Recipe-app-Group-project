Rails.application.routes.draw do
<<<<<<< Updated upstream
  devise_for :users
  root to: "home#index"
=======
  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes
  resources :inventories
  resources :users
>>>>>>> Stashed changes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
