require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates with first, last name, email and pass' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.org', password: '123456')
    expect(user).to be_valid
  end

  it 'fails without first name' do
    user = User.new(last_name: 'Doe', email: 'john@doe.org', password: '123456')
    expect(user).not_to be_valid
  end

  it 'fails without first name' do
    user = User.new(last_name: 'Doe', email: 'john@doe.org', password: '123456')
    expect(user).not_to be_valid
  end

  it 'fails without last name' do
    user = User.new(first_name: 'John', email: 'john@doe.org', password: '123456')
    expect(user).not_to be_valid
  end

  it 'fails with short pass' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@doe.org', password: '12')
    expect(user).not_to be_valid
  end

  it 'returns valid full name' do
    user = User.new(first_name: 'John', last_name: 'Doe')
    expect(user.full_name).to eq('Doe John')
  end
end
