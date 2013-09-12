# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :titletime do
    movie "MyString"
    hour 1
    minute 1
    second 1
    cheese false
  end
end
