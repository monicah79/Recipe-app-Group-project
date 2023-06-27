class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipes, through: :recipe_foods
  has_many :recipe_foods
end
