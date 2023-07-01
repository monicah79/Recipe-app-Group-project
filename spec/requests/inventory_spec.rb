require 'rails_helper'

RSpec.describe Inventory, type: :model do
  fixtures :users, :inventories

  let(:first_user) { users(:first_user) }
  let(:second_user) { users(:second_user) }
  let(:first_inventory) { inventories(:first_inventory) }
  let(:second_inventory) { inventories(:second_inventory) }

  describe 'associations' do
    it 'belongs to a user' do
      expect(first_inventory.user).to eq(first_user)
      expect(second_inventory.user).to eq(second_user)
    end

    it 'has many inventory_foods' do
      expect(first_inventory.inventory_foods).not_to be_empty
      expect(second_inventory.inventory_foods).not_to be_empty
    end
  end

  describe 'validations' do
    it 'requires name and description' do
      expect(first_inventory).to be_valid
      expect(second_inventory).to be_valid

      first_inventory.name = nil
      first_inventory.description = nil
      expect(first_inventory).to_not be_valid

      second_inventory.name = ''
      second_inventory.description = ''
      expect(second_inventory).to_not be_valid
    end
  end
end
