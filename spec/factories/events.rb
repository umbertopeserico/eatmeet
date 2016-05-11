FactoryGirl.define do
  factory :event do
    title "Evento Test 1"
    schedule "2016-05-11 20:00:00"
    max_people 20
    min_people 8
    people_min_price 15
    max_price 20
    min_price 15
    actual_price 20
    menu
  end
end
