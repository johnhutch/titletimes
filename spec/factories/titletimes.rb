require 'faker'

FactoryGirl.define do
  factory :titletime do
    # new User created on the fly
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

    factory :random_titletime do
      hour            Random.rand(2)
      minute          Random.rand(60)
      second          Random.rand(60)
    end

    # inherits all attributes, then overrides what is different
    factory :invalid_titletime do
      movie           nil
      hour            -2
    end
  end
end