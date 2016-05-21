# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

FactoryGirl.define do
  factory :category do
    name 'TestCategory'
  end
end
