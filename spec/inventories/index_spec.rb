require 'rails_helper'

RSpec.describe 'Inventories', type: :system do
  before :all do
    @first1 = User.create(name: 'Tom', email: 'mail1@gmail.com', password: '123456',
                          password_confirmation: '123456')
    @first1.save
    @first_inventory = @first1.inventories.create(name: 'Inventory 1', description: 'Inventory1 description')
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

    expect(page).to have_content('Public Recipes')
    visit inventories_path
    expect(page).to have_content('Inventory 1')
  end

  scenario 'I can see the remove button' do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Public Recipes')
    visit inventories_path
    expect(page).to have_button('Remove')
  end

  scenario "I can see the Recipe's id" do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Public Recipes')
    visit inventories_path
    expect(page).to have_content(@first_inventory.name)
  end
end
