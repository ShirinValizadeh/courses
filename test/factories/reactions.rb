FactoryBot.define do
  factory :reaction do
    reactionable_type { "MyString" }
    reactionable_id { 1 }
    user_id { 1 }
    reaction { 1 }
  end
end
