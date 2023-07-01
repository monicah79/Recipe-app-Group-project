
first_user = User.create(name: 'Tom', email: "mail1@gmail.com", password: "123456", password_confirmation: "123456")
second_user = User.create(name: 'Lilly', email: "mail2@gmail.com", password: "123456", password_confirmation: "123456")

first_food = Food.create(name: "Food 1", price: "100", measurement_unit: "kg")
second_food = Food.create(name: "Food 2", price: "200", measurement_unit: "kg")
third_food = Food.create(name: "Food 3", price: "150", measurement_unit: "kg")
fourth_food = Food.create(name: "Food 4", price: "100", measurement_unit: "ltr")

first_inventory = Inventory.create(user: first_user, name: 'Inventory 1', description: "Inventory1 description")
second_inventory = Inventory.create(user: second_user, name: 'Inventory 2', description: "Inventory1 description")

first_recipe = Recipe.create(name: "Recipe 1", user: first_user, preparation_time: "2", cooking_time: "1", description: "Description for Recipe 1", public: true)
second_recipe = Recipe.create(name: "Recipe 2", user: first_user, preparation_time: "2", cooking_time: "1", description: "Description for Recipe 2", public: true)
third_recipe = Recipe.create(name: "Recipe 3", user: first_user, preparation_time: "2", cooking_time: "1", description: "Description for Recipe 3", public: false)
fourth_recipe = Recipe.create(name: "Recipe 4", user: second_user, preparation_time: "2", cooking_time: "1", description: "Description for Recipe 4", public: false)

first_inventory_food = InventoryFood.create(quantity: 2, inventory: first_inventory, food: first_food)
second_inventory_food = InventoryFood.create(quantity: 2, inventory: first_inventory, food: second_food)
third_inventory_food = InventoryFood.create(quantity: 4, inventory: second_inventory, food: second_food)
fourh_inventory_food = InventoryFood.create(quantity: 1, inventory: second_inventory, food: third_food)

first_recipe_food = RecipeFood.create(quantity: 3, recipe: first_recipe, food: first_food)
second_recipe_food = RecipeFood.create(quantity: 2, recipe: first_recipe, food: second_food)
third_recipe_food = RecipeFood.create(quantity: 3, recipe: first_recipe, food: third_food)
second_recipe_food = RecipeFood.create(quantity: 2, recipe: second_recipe, food: second_food)
third_recipe_food = RecipeFood.create(quantity: 3, recipe: second_recipe, food: fourth_food)
