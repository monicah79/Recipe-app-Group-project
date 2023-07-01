require 'rails_helper'

RSpec.describe 'Inventory', type: :request do
  fixtures :users, :recipes, :foods

  before do
    @user = users(:first_user)
    @first_recipe = recipes(:first_recipe)
    @first_food = foods(:first_food)
    sign_in @user
  end

  describe 'GET /recipes' do
    it 'should respond with success' do
      get '/recipes'
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get '/recipes'
      expect(response).to render_template('index')
    end
  end

  describe 'GET /recipe/:id' do
    it 'should respond with success' do
      get recipe_path(@first_recipe)
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get recipe_path(@first_recipe)
      expect(response).to render_template('show')
    end

    it 'should include food name in the response body' do
      get recipe_path(@first_recipe)
      expect(response.body).to include(@first_food.name)
    end
  end

  describe 'POST /recipe' do
    it 'creates a new inventory' do
      recipe = { name: 'Recipe 5', description: 'Description for Recipe 5', user_id: @user.id,
                 preparation_time: 2, cooking_time: 1, public: false }

      expect do
        post '/recipes', params: { recipe: }
      end.to change { Recipe.count }.by(1)

      new_recipe = Recipe.last

      expect(new_recipe.name).to eq(recipe[:name])
      expect(new_recipe.description).to eq(recipe[:description])
      expect(new_recipe.user_id).to eq(@user.id)
    end

    it 'redirects to the created inventory' do
      recipe = { name: 'Recipe 5', description: 'Description for Recipe 5', user_id: @user.id,
                 preparation_time: 2, cooking_time: 1, public: false }

      post '/recipes', params: { recipe: }
      new_recipe = Recipe.last
      expect(response).to redirect_to(recipe_path(new_recipe))
    end
  end
end
