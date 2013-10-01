FactoryGirl.define do
  factory :titletime do
    sequence(:movie)  { |n| "Scream #{n}" }
    hour              1
    minute            5
    second            9
    cheese            false
  end
end