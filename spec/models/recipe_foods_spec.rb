require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  fixtures :recipes, :foods, :recipe_foods

  let(:first_recipe) { recipes(:first_recipe) }
  let(:second_recipe) { recipes(:second_recipe) }
  let(:first_food) { foods(:first_food) }
  let(:second_food) { foods(:second_food) }
  let(:third_food) { foods(:third_food) }
  let(:fourth_food) { foods(:fourth_food) }
  let(:first_recipe_food) { recipe_foods(:first_recipe_food) }
  let(:second_recipe_food) { recipe_foods(:second_recipe_food) }
  let(:third_recipe_food) { recipe_foods(:third_recipe_food) }
  let(:fourth_recipe_food) { recipe_foods(:fourth_recipe_food) }
  let(:fifth_recipe_food) { recipe_foods(:fifth_recipe_food) }

  describe 'associations' do
    it 'belongs to a recipe' do
      expect(first_recipe_food.recipe).to eq(first_recipe)
      expect(second_recipe_food.recipe).to eq(first_recipe)
      expect(third_recipe_food.recipe).to eq(first_recipe)
      expect(fourth_recipe_food.recipe).to eq(second_recipe)
      expect(fifth_recipe_food.recipe).to eq(second_recipe)
    end

    it 'belongs to a food' do
      expect(first_recipe_food.food).to eq(first_food)
      expect(second_recipe_food.food).to eq(second_food)
      expect(third_recipe_food.food).to eq(third_food)
      expect(fourth_recipe_food.food).to eq(second_food)
      expect(fifth_recipe_food.food).to eq(fourth_food)
    end
  end
end
