# == Schema Information
#
# Table name: zones
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

FactoryGirl.define do
  factory :zone do
    name 'ZoneTest'
  end
end
