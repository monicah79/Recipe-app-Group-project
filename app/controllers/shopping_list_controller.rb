class ShoppingListController < ApplicationController
  def index
    current_user
    @recipes = current_user.recipes
    @foods = ShoppingList.all
    

    @joined_table = @joined_table = RecipeFood
      .select('recipe_foods.id, foods.name, foods.price, foods.measurement_unit, recipe_foods.quantity AS rc_qty, inventory_foods.quantity AS inv_qty, inventory_foods.id')
      .joins(:food)
      .left_joins(food: :inventory_foods)
      .where(recipe_id: 1, 'inventory_foods.inventory_id': 1)

    @joined_table.each do |record|
      puts "Food Name: #{record.name}"
      puts "Food Price: #{record.price}"
      puts "Measurement Unit: #{record.measurement_unit}"
      puts "Recipe Quantity: #{record.rc_qty}"
      puts "Inventory Quantity: #{record.inv_qty}"
      puts "Inventory Food ID: #{record.id}"
      puts "---------------------"
    end
  end
end

# @foods = @recipes.flat_map(&:foods).uniq
    # @total_price = @recipes.sum(&:total_price)

    # recipe_id = params[:recipe_id]
    # inventory_id = params[:inventory_id]
