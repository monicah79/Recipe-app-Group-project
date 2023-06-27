class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :food, through: :recipe_foods
end
