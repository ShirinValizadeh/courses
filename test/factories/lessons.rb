# frozen_string_literal: true

FactoryBot.define do
  factory :lesson do
    sequence(:title) { |n| "Lesson #{n}" }
    sequence(:body) { |n| "Lesson Body #{n}" }
    course
  end
end
