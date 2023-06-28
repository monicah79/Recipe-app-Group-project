class AddRecipeIdToRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_ingredients, :recipe, null: false, foreign_key: true
  end
end
