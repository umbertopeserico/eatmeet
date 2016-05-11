# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  title            :string           not null
#  schedule         :datetime         not null
#  menu_id          :integer          not null
#  max_people       :integer          not null
#  min_people       :integer          not null
#  people_min_price :integer          not null
#  max_price        :decimal(20, 2)   default(0.0)
#  min_price        :decimal(20, 2)   default(0.0)
#  actual_price     :decimal(20, 2)   default(0.0)
#  prices_array     :decimal(, )      is an Array
#

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
