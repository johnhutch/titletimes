require 'faker'

FactoryGirl.define do
  factory :titletime do
    association       :user
    sequence(:movie)  { |n| "Scream #{n}" }
    hour              1
    minute            25
    second            43
    cheese            false

    factory :early_titletime do
      hour            0
      minute          4
      second          9
    end
  end
end