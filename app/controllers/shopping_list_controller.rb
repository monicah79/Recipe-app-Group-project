class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user
    @recipe_id = params[:recipe_id]
    @inventory_id = params[:inventory_id]

    @shopping_list = []
    @total_amount = 0

    return unless @recipe_id && @inventory_id

    process_recipe_list
  end

  def print_record_item(name, items)
    puts "#{name} ------------"
    items.each do |record|
      record.attributes.each_key do |key|
        p "#{key}: #{record[key]}"
      end
      puts '--------------'
    end
  end

  def process_recipe_list
    @recipe = RecipeFood.find(@recipe_id).recipe
    @inventory = InventoryFood.find(@inventory_id).inventory

    new_recipe_foods = RecipeFood.select('recipe_foods.id, foods.id AS food_id, foods.name, foods.price
      ,foods.measurement_unit, recipe_foods.quantity').joins(:food).where(recipe_id: @recipe_id)
    new_inventory_foods = InventoryFood.where(inventory_id: @inventory_id)

    # print_record_item('recipe_foods', new_recipe_foods)
    # print_record_item('new_inventory_foods', new_inventory_foods)

    new_recipe_foods.each do |record|
      inv_food = new_inventory_foods.find_by(food_id: record.food_id)

      inventory_qty = inv_food&.quantity || 0

      next unless inventory_qty < record.quantity

      shopping_qty = record.quantity - inventory_qty
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
