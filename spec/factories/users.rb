FactoryGirl.define do
  factory :user do
    sequence(:username)   { |n| "testuser#{n}" }
    sequence(:email)      { |n| "test#{n}@example.com" }
    password              "changeme"
    password_confirmation "changeme"
  end
end