# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#  surname    :string           not null
#  full_name  :string
#  email      :string           not null
#

FactoryGirl.define do
  factory :user do
    name "User"
    surname "Test"
    sequence(:email) { |n| "usertest#{n}" }
  end
end
