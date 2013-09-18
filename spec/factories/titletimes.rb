FactoryGirl.define do

  sequence(:movie)  { |n| "Number #{n} Movie" }

  factory :titletime do
    movie  :movie
    hour   1
    minute 24
    second 27
    cheese false
  end

end