require 'rails_helper'
# include Devise::Test::IntegrationHelpers

RSpec.describe 'Recipe#show page', type: :system do
  fixtures :users, :recipes, :foods, :recipe_foods

  before do
    @user = users(:first_user)
    @first_recipe = recipes(:first_recipe)
    @first_food = foods(:first_food)
    @second_food = foods(:second_food)
    @third_food = foods(:third_food)
    @first_recipe_food = recipe_foods(:first_recipe_food)
    @second_recipe_food = recipe_foods(:second_recipe_food)
    @third_recipe_food = recipe_foods(:third_recipe_food)
    sign_in @user
  end

  it 'displays the selected recipe_food' do
    visit recipe_path(@first_recipe)

    expect(page).to have_selector('tbody tr', count: 3)
    expect(page).to have_content(@first_recipe_food.quantity)
  end

  it 'when I click on a Add Food btn, the page should redirect to Add Food page.' do
    visit recipe_path(@first_recipe)

    click_link 'Add Ingredient'
    expect(page).to have_current_path(%r{/recipe_foods/new})
  end
end
