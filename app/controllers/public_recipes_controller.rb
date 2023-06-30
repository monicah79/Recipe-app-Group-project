class PublicRecipesController < ApplicationController
  def index
    # @recipes = Recipe.public_recipes
    @recipes = Recipe
      .select('recipes.name AS recipe_name, users.name AS author_name
      , COUNT(foods.id) AS food_count
      , SUM(CAST(foods.price AS numeric) * recipe_foods.quantity) AS total_amount')
      .joins(:user)
      .joins(recipe_foods: :food)
      .where(public: true)
      .group('recipes.id, users.id')
  end
end
