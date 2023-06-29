class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :food, through: :recipe_foods

  def self.public_recipes
    where(public: true)
  end
end
