require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/public_recipes'
      expect(response).to have_http_status(:success)
    end
  end
end
