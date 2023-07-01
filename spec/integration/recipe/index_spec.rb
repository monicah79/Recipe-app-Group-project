require 'rails_helper'
# include Devise::Test::IntegrationHelpers

RSpec.describe 'Recipe#index page', type: :system do
  fixtures :users, :recipes

  before do
    @user = users(:first_user)
    @first_recipe = recipes(:first_recipe)
    sign_in @user
  end

  it "displays the user's recipes" do
    visit recipes_path(@user)

    expect(page).to have_content(@first_recipe.name)
  end

  it 'when Add Food Inventory btn is clicked, the page should redirect to Add New Recipe page.' do
    visit recipes_path(@user)

    click_link 'Add a new recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'when Food Inventory item is clicked, the page should redirect to a detail Recipe Food page.' do
    visit recipes_path(@user)

    click_link @first_recipe.name
    expect(page).to have_current_path(recipe_path(@first_recipe))
  end
end
