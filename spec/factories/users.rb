FactoryGirl.define do
  factory :user do
    name '#{Random.firstname} #{Random.lastname}'
    email 'okayokay@gmail.com'
    password 'changeme'
    password_confirmation 'changeme'
  
    # Devise's confirmable is turned on
    confirmed_at = Time.now
  end
end