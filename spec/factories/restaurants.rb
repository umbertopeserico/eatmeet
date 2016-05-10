FactoryGirl.define do
  factory :restaurant do
    name 'Restaurant Test'
    description 'Description Test'
    sequence(:email) { |n| "rest#{n}@foo.it" }
    phone '0445401245'
    street 'Via Prova 10'
    city 'Trento'
    zip_code '38121'
    province 'Trento'
    restaurant_owner
  end
end
