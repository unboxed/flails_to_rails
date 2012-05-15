FactoryGirl.define do
  factory :entry do
    sequence(:url) { |n| "http://www.example.com/#{n}" }
    title "Funny cat pictures"
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end
