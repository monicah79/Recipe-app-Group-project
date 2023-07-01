require 'rails_helper'

RSpec.describe Recipe, type: :model do
  fixtures :users, :recipes, :recipe_foods

  let(:first_user) { users(:first_user) }
  let(:second_user) { users(:second_user) }
  let(:first_recipe) { recipes(:first_recipe) }
  let(:second_recipe) { recipes(:second_recipe) }
  let(:third_recipe) { recipes(:third_recipe) }
  let(:fourth_recipe) { recipes(:fourth_recipe) }

  describe 'associations' do
    it 'belongs to a user' do
      expect(first_recipe.user).to eq(first_user)
      expect(second_recipe.user).to eq(first_user)
    end

    it 'has many recipe_foods' do
      expect(first_recipe.recipe_foods.count).to eq(3)
      expect(second_recipe.recipe_foods.count).to eq(2)
      expect(third_recipe.recipe_foods.count).to eq(0)
    end
  end

  describe 'public_recipes' do
    it 'returns public recipes' do
      public_recipes = Recipe.public_recipes
      expect(public_recipes).to include(first_recipe, second_recipe)
      expect(public_recipes).not_to include(third_recipe, fourth_recipe)
    end
  end
end
