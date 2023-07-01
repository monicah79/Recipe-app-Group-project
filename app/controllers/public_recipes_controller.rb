class PublicRecipesController < ApplicationController
  def index
    
    @public_recipes = Recipe.includes(:user, :food, :recipe_foods).where(public: true).order(created_at: :desc)
    
 
end
