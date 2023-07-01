require 'rails_helper'

RSpec.describe 'Recipe#shoppinglist', type: :system do
  fixtures :users, :inventories, :recipes, :foods, :recipe_foods

  before do
    @user = users(:first_user)
    @first_inventory = inventories(:first_inventory)
    @first_recipe = recipes(:first_recipe)
    @first_food = foods(:first_food)
    @second_food = foods(:second_food)
    @third_food = foods(:third_food)
    @first_recipe_food = recipe_foods(:first_recipe_food)
    @second_recipe_food = recipe_foods(:second_recipe_food)
    @third_recipe_food = recipe_foods(:third_recipe_food)
    sign_in @user
  end

  it 'displays the selected shopping_list for the selected recipe and inventory' do
    visit "/shopping_list/#{@first_recipe.id}?recipe_id=#{@first_recipe.id}&inventory_id=#{@first_inventory.id}"

    expect(page).to have_selector('tbody tr', count: 2)
    expect(page).to have_content('Total value of food needed: $550')
    expect(page).to have_content('Amount of food items to buy: 2')
  end

  #   it 'when recipe name is clicked should go back to the recipe page' do
  #     click_link @first_recipe.name

  #     expect(page).to have_current_path(recipe_path(@first_recipe))
  #   end

  #     it 'when inventory name is clicked should go back to the recipe page' do
  #     click_link @first_inventory.name

  #     expect(page).to have_current_path(rece_path(@first_inventory))
  #   end
end
