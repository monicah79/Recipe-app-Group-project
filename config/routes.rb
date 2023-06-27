Rails.application.routes.draw do
  devise_for :users
  root to: "foods#index"
  resources :recipe_foods
  resources :inventory_foods
  resources :foods
  resources :recipes do
    patch 'toggle_visibility', on: :member
  end
  resources :public_recipes
  resources :shopping_list
  resources :inventories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
