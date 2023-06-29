class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.public_recipes
    @recipe_foods = RecipeFood.all
  end
end
