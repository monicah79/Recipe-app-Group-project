# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', email: "mail1@gmai.com", password: "123456", password_confirmation: "123456")
second_user = User.create(name: 'Lilly', email: "mail2@gmail.com", password: "123456", password_confirmation: "123456")

first_inventory = Inventory.create(user: first_user, name: 'Inventory 1', description: "Inventory1 description")
second_inventory = Inventory.create(user: second_user, name: 'Inventory 2', description: "Inventory1 description")

first_food = Food.create(name: "Food 1", price: "1000", measurement_unit: "gram")
second_food = Food.create(name: "Food 2", price: "2000", measurement_unit: "gram")

first_inventory_food = InventoryFood.create(quantity: 20, inventory: first_inventory, food: first_food)
second_inventory_food = InventoryFood.create(inventory: first_inventory, food: second_food)
third_inventory_food = InventoryFood.create(inventory: second_inventory, food: second_food)
