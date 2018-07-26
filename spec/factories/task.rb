FactoryBot.define do
  factory :task do
    title 'Default task'
    description 'Default task description for example'
    association :author, factory: :user
    association :assigned_to, factory: :user
  end
end
