class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user
    @recipe = Recipe.find(1)

    @recipe_id = params[:recipe_id]
    @inventory_id = params[:inventory_id]
    @shopping_list = []
    @total_amount = 0

    if @recipe_id && @inventory_id
      @recipe = RecipeFood.find(@recipe_id).recipe
      @inventory = InventoryFood.find(@inventory_id).inventory

      @recipe_list = RecipeFood
        .select('recipe_foods.id, foods.name, foods.price, foods.measurement_unit,
          recipe_foods.quantity AS rc_qty, inventory_foods.quantity AS inv_qty, inventory_foods.id')
        .joins(:food)
        .joins('LEFT JOIN inventory_foods ON foods.id = inventory_foods.food_id AND inventory_foods.inventory_id = 1')
        .where(recipe_id: @recipe_id)

      process_recipe_list

    else
      flash.now[:notice] = 'Please make sure you have selected valid Inventory and Recipe'
    end
  end

  def print_recod(record)
    puts "Food Name: #{record.name}"
    puts "Food Price: #{record.price}"
    puts "Measurement Unit: #{record.measurement_unit}"
    puts "Recipe Quantity: #{record.rc_qty}"
    puts "Inventory Quantity: #{record.inv_qty}"
    puts "Inventory Food ID: #{record.id}"
    puts '---------------------'
  end

  def process_recipe_list
    @recipe_list.each do |record|
      print_recod(record)
      record.inv_qty = 0 if record.inv_qty.nil?

      next unless record.inv_qty < record.rc_qty

      shopping_qty = record.rc_qty - record.inv_qty
      shopping_amount = shopping_qty * record.price.to_i

      @total_amount += shopping_amount

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
