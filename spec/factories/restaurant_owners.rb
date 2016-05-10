FactoryGirl.define do
  factory :restaurant_owner do
    sequence(:name) { |n| "Restaurant Owner Test#{n} Name" }
    sequence(:surname) { |n| "Restaurant Owner Test#{n} Name" }
    sequence(:email) { |n| "rowner#{n}@foo.bar" }
    password 'ciao1234'
    password_confirmation 'ciao1234'
  end
end
