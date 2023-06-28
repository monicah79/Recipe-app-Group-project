class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.public_recipes
    @recipe_ingredients = RecipeIngredient.all
  end
end
