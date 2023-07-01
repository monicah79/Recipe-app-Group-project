require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  before :all do
    @first1 = User.create(name: 'Tom', email: 'mail1@gmail.com', password: '123456',
                          password_confirmation: '123456')
    @second_user = User.create(name: 'Lilly', email: 'mail2@gmail.com', password: '123456',
                               password_confirmation: '123456')
    @first1.save
    @firstrecipe = @first1.recipes.create(name: 'Recipe 1', preparation_time: '2', cooking_time: '1',
                                          description: 'Description for Recipe 1', public: true)
    @secondrecipe = @first1.recipes.create(name: 'Recipe 2', preparation_time: '2', cooking_time: '1',
                                           description: 'Description for Recipe 2', public: true)
    @third_recipe = @first1.recipes.create(name: 'Recipe 3', preparation_time: '2', cooking_time: '1',
                                           description: 'Description for Recipe 3', public: false)
    @fourth_recipe = Recipe.create(name: 'Recipe 4', preparation_time: '2', cooking_time: '1',
                                   description: 'Description for Recipe 4', public: false, user: @second_user)
  end

  after :all do
    User.destroy_all
    Recipe.destroy_all
  end

  scenario "I can see the Recipe's id" do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')
    visit recipes_path
    expect(page).to have_content('Recipe 1')
  end

  scenario "I can see the Recipe's id" do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')
    visit recipes_path
    expect(page).to have_link('Add a new recipe', href: new_recipe_path, class: 'add-recipe')
  end

  scenario "I can see the Recipe's id" do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')
    visit recipes_path
    expect(page).to have_content(@firstrecipe.name)
  end

  scenario 'to have the remove button' do
    visit new_user_session_path

    fill_in 'Email', with: 'mail1@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Food')
    visit recipes_path
    expect(page).to have_button('Remove')
  end
end
