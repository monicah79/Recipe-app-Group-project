require 'rails_helper'

RSpec.describe 'User inventories index page', type: :system do
  fixtures :users, :inventories

  before do
    @user = users(:first_user)
    @first_inventory = inventories(:first_inventory)
    sign_in @user
  end

  it "displays the user's inventories" do
    visit inventories_path(@user)

    expect(page).to have_content(@first_inventory.name)
  end
end
