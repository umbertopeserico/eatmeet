# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string           not null
#  text_menu     :text
#  html_menu     :text
#  max_price     :decimal(20, 2)   default(0.0)
#  min_price     :decimal(20, 2)   default(0.0)
#  restaurant_id :integer          not null
#

FactoryGirl.define do
  factory :menu do
    title 'Menu Test 1'
    html_menu 'Primo: pasta <br /> Secondo: carne'
    max_price '15'
    min_price '12'
    restaurant
  end
end
