class ShoppingListController < ApplicationController

  def index
    current_user
    @recipes = current_user.recipes
    @foods = ShoppingList.all
    

    @recipe_list = @joined_table = RecipeFood
      .select('recipe_foods.id, foods.name, foods.price, foods.measurement_unit, recipe_foods.quantity AS rc_qty, inventory_foods.quantity AS inv_qty, inventory_foods.id')
      .joins(:food)
      .left_joins(food: :inventory_foods)
      .where(recipe_id: 1, 'inventory_foods.inventory_id': 1)

    @recipe_list.each do |record|
      puts "Food Name: #{record.name}"
      puts "Food Price: #{record.price}"
      puts "Measurement Unit: #{record.measurement_unit}"
      puts "Recipe Quantity: #{record.rc_qty}"
      puts "Inventory Quantity: #{record.inv_qty}"
      puts "Inventory Food ID: #{record.id}"
      puts "---------------------"
    end
  end

  def show
    current_user
    @recipe = Recipe.find(1)

    @recipe_list = @joined_table = RecipeFood
      .select('recipe_foods.id, foods.name, foods.price, foods.measurement_unit, recipe_foods.quantity AS rc_qty, inventory_foods.quantity AS inv_qty, inventory_foods.id')
      .joins(:food)
      .left_joins(food: :inventory_foods)
      .where(recipe_id: 1, 'inventory_foods.inventory_id': 1)

    @shopping_list = []

    @recipe_list.each do |record|
      puts "Food Name: #{record.name}"
      puts "Food Price: #{record.price}"
      puts "Measurement Unit: #{record.measurement_unit}"
      puts "Recipe Quantity: #{record.rc_qty}"
      puts "Inventory Quantity: #{record.inv_qty}"
      puts "Inventory Food ID: #{record.id}"
      puts "---------------------"

      if record.inv_qty < record.rc_qty
        shopping_qty = record.rc_qty - record.inv_qty
        shopping_amount = shopping_qty * record.price.to_i

        @shopping_list << {
          name: record.name,
          price: record.price,
          measurement_unit: record.measurement_unit,
          qty: shopping_qty,
          amount: shopping_amount
        }      
      end
    end
  end
end

# @foods = @recipes.flat_map(&:foods).uniq
    # @total_price = @recipes.sum(&:total_price)

    # recipe_id = params[:recipe_id]
    # inventory_id = params[:inventory_id]
