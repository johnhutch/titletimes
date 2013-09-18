FactoryGirl.define do

  sequence(:name)  { |n| "Bob Loblaw #{n}" }
  sequence(:email) { |n| "okayokay+#{n}@gmail.com" }

  factory :user do
    name      { generate(:name) }
    email     { generate(:email) }
    password  'changeme'
    password_confirmation 'changeme'
  
    # Devise's confirmable is turned on
    confirmed_at = Time.now
  end

end