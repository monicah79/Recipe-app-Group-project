require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  fixtures :inventories, :foods, :inventory_foods

  let(:first_inventory) { inventories(:first_inventory) }
  let(:second_inventory) { inventories(:second_inventory) }
  let(:first_food) { foods(:first_food) }
  let(:second_food) { foods(:second_food) }
  let(:third_food) { foods(:third_food) }
  let(:first_inventory_food) { inventory_foods(:first_inventory_food) }
  let(:second_inventory_food) { inventory_foods(:second_inventory_food) }
  let(:third_inventory_food) { inventory_foods(:third_inventory_food) }
  let(:fourth_inventory_food) { inventory_foods(:fourth_inventory_food) }

  describe 'associations' do
    it 'belongs to an inventory' do
      expect(first_inventory_food.inventory).to eq(first_inventory)
      expect(second_inventory_food.inventory).to eq(first_inventory)
      expect(third_inventory_food.inventory).to eq(second_inventory)
      expect(fourth_inventory_food.inventory).to eq(second_inventory)
    end

    it 'belongs to a food' do
      expect(first_inventory_food.food).to eq(first_food)
      expect(second_inventory_food.food).to eq(second_food)
      expect(third_inventory_food.food).to eq(second_food)
      expect(fourth_inventory_food.food).to eq(third_food)
    end
  end
end
