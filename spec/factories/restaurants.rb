# == Schema Information
#
# Table name: restaurants
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string           not null
#  description         :text
#  email               :string           not null
#  phone               :string
#  street              :string
#  city                :string
#  zip_code            :string
#  province            :string
#  full_address        :string
#  restaurant_owner_id :integer          not null
#

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
