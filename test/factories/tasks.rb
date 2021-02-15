FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }

    assignee factory: :user
  end
end
