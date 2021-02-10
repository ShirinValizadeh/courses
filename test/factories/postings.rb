FactoryBot.define do
  factory :posting do
    sequence(:title) { |n| "Posting #{n}" }
    sequence(:description) { |n| "Posting Description #{n}" }
  
  end
end
