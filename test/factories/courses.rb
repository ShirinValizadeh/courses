# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Course #{n}" }
    sequence(:description) { |n| "Course Description #{n}" }
    user factory: :author
  end
end
