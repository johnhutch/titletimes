FactoryGirl.define do
  factory :user do
    username              { Faker::Internet.user_name }
    email                 { Faker::Internet.email }
    password              "changeme"
    password_confirmation "changeme"

    after(:build) do |user|
      3.times do
        user.titletimes << FactoryGirl.build(:titletime, user: user)
      end
    end
  end
end