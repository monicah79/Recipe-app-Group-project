require 'rails_helper'
# include Devise::Test::IntegrationHelpers

RSpec.describe 'User inventories show page', type: :system do
  fixtures :users, :inventories, :foods, :inventory_foods

  before do
    @user = users(:first_user)
    @first_inventory = inventories(:first_inventory)
    @first_food = foods(:first_food)
    @second_food = foods(:second_food)
    @first_inventory_food = inventory_foods(:first_inventory_food)
    @second_inventory_food = inventory_foods(:second_inventory_food)
    sign_in @user
  end

  it 'displays the selected inventory_food' do
    visit inventory_path(@first_inventory)

    expect(page).to have_content(@first_food.name)
    expect(page).to have_selector('tbody tr', count: 2)
  end

  it 'when I click on a Add Food btn, the page should redirect to Add Food page.' do
    visit inventory_path(@first_inventory)

    click_link 'Add Food'
    expect(page).to have_current_path(%r{/foods/new\z})
  end

  it 'when I click on a Add Food Inventory btn, the page should redirect to Add Food Inventory page.' do
    visit inventory_path(@first_inventory)

    click_link 'Add Food Inventory'
    expect(page).to have_current_path(%r{/inventory_foods/new\z})
  end
end
