require 'rails_helper'

RSpec.describe 'Inventories', type: :system do
  before :all do
    @first1 = User.create(name: 'Tom', email: 'mail1@gmail.com', password: '123456',
                          password_confirmation: '123456')

    @first_inventory = @first1.inventories.create(user: @first1, name: 'Inventory 1',
                                                  description: 'Inventory1 description')
    @first1.save

    @first1.save
    first_food = Food.create(name: 'Food 1', price: '100', measurement_unit: 'kg')
    second_food = Food.create(name: 'Food 2', price: '200', measurement_unit: 'kg')
    Food.create(name: 'Food 3', price: '150', measurement_unit: 'kg')
    Food.create(name: 'Food 4', price: '100', measurement_unit: 'ltr')

    @first_inventory_food = @first_inventory.inventory_foods.build(quantity: 2, food: first_food)
    @second_inventory_food = @first_inventory.inventory_foods.build(quantity: 2, food: second_food)
  end

  after :all do
    User.destroy_all
    Inventory.destroy_all
  end

  scenario 'I can see the inventories id' do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')
    visit inventories_path
    expect(page).to have_content('Inventory 1')

    visit inventories_path
    expect(page).to have_content('Inventory 1')

    visit inventory_path(@first_inventory)
    expect(page).to have_content('Food')
  end

  scenario 'I can see the Back to inventories link' do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')

    visit inventories_path
    expect(page).to have_content('Inventory 1')

    visit inventory_path(@first_inventory)
    expect(page).to have_link('Back to inventories')
  end

  scenario 'to have link Edit this inventory' do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')

    visit inventories_path
    expect(page).to have_content('Inventory 1')

    visit inventory_path(@first_inventory)
    expect(page).to have_link('Add Food Inventory')
  end
end
