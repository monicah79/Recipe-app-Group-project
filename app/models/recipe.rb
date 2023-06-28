class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :food, through: :recipe_foods
  has_many :recipe_ingredients, class_name: 'RecipeIngredient'
  has_many :ingredients, through: :recipe_ingredients, class_name: 'Ingredient'

  def total_price
    ingredients.sum(:price)
  end
  def self.public_recipes
    where(public: true)
  end
end
