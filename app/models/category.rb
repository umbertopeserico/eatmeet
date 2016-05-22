# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Category < ActiveRecord::Base
  # Validations
  validates :name,          presence: true,
                            uniqueness: { case_sensitive: false }

  # Relations
  has_and_belongs_to_many :events
end