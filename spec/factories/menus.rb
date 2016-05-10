FactoryGirl.define do
  factory :menu do
    title 'Menu Test 1'
    html_menu 'Primo: pasta <br /> Secondo: carne'
    max_price '15'
    min_price '12'
    restaurant
  end
end
