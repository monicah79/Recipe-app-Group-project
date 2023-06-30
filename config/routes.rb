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
  # resources :shopping_list
  resources :inventories
  resources :users
  # get '/shopping_list', to: 'shopping_list#show', as: 'shopping_list'

  get '/shopping_list/:recipe_id', to: 'shopping_list#show', as: 'shopping_list'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
