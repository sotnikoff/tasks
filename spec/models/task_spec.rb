require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:assigned_to) { create :user }
  let(:author) { create :user }

  it 'validates with required fields' do
    task = Task.new(assigned_to: assigned_to, author: author, title: 'Hello world')
    expect(task).to be_valid
  end

  it 'fails without author' do
    task = Task.new(assigned_to: assigned_to, title: 'Hello world')
    expect(task).not_to be_valid
  end
end
