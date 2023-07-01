require 'rails_helper'

RSpec.describe 'Inventory', type: :request do
  fixtures :users, :inventories, :foods

  before do
    @user = users(:first_user)
    @first_inventory = inventories(:first_inventory)
    @first_food = foods(:first_food)
    sign_in @user
  end

  describe 'GET /inventories' do
    it 'should respond with success' do
      get '/inventories'
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get '/inventories'
      expect(response).to render_template('index')
    end
  end

  describe 'GET /inventories/:id' do
    it 'should respond with success' do
      get inventory_path(@first_inventory)
      expect(response).to have_http_status(:success)
    end

    it 'should render correct template' do
      get inventory_path(@first_inventory)
      expect(response).to render_template('show')
    end

    it 'should include food name in the response body' do
      get inventory_path(@first_inventory)
      expect(response.body).to include(@first_food.name)
    end
  end

  describe 'POST /inventory' do
    it 'creates a new inventory' do
      data = { inventory: { name: 'Inventory 3', description: 'Inventory 3 description', user_id: @user.id } }

      expect do
        post '/inventories', params: data
      end.to change { Inventory.count }.by(1)

      new_inventory = Inventory.last

      expect(new_inventory.name).to eq('Inventory 3')
      expect(new_inventory.description).to eq('Inventory 3 description')
      expect(new_inventory.user_id).to eq(@user.id)
    end

    it 'redirects to the created inventory' do
      params = { inventory: { name: 'Inventory 3', description: 'Inventory 3 description', user_id: @user.id } }

      post('/inventories', params:)
      created_inventory = Inventory.last
      expect(response).to redirect_to(inventory_path(created_inventory))
    end
  end
end
