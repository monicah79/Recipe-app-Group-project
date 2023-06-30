require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', email: 'mail3@gmail.com', password: '123456') }

  it 'name should be present' do
    expect(subject).to be_valid
  end
end
