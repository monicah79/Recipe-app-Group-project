class ShoppingListController < ApplicationController
  def index
    current_user
    @recipes = current_user.recipes
    @foods = @recipes.flat_map(&:foods).uniq
    @total_price = @recipes.sum(&:total_price)
  end
end
