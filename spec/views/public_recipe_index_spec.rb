require 'rails_helper'
require 'capybara/rails'

RSpec.configure do |config|
  config.include Capybara::DSL
end

describe 'public_recipes/index', type: :view do
  before(:example) do
    @user = User.create(name: 'Mary', email: 'mary@gmail.com', password: '111111', confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Lemon', description: 'lemon margarita', public: true, cooking_time: 3,
                            preparation_time: 1, user: @user)
  end

  it 'renders a list of recipes' do
    visit '/public_recipes'
    expect(page).to have_content('Public Recipes')
  end
end
