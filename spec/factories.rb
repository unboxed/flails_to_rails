FactoryGirl.define do
  factory :entry do
    sequence(:url) { |n| "http://www.example.com/#{n}" }
    title "Funny cat pictures"
    sequence(:email) { |n| "user#{n}@example.com" }
  end

  factory(:comment) do
    body "This is rubbish! Down with this sort of thing!"
    sequence(:email) { |n| "commenter#{n}@example.com" }
    association :entry, :factory => :entry
  end
end
