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

class Restaurant < ActiveRecord::Base
  # Validations
  validates :name,              presence: true
  validates :email,             presence: true
  validates :restaurant_owner,  presence: true

  # Relations
  has_many :menus, dependent: :destroy
  has_and_belongs_to_many :zones
  has_many :events, through: :menus
  has_many :photos, as: :imageable
  belongs_to :restaurant_owner

  # Callbacks
  before_save :set_full_address

  # Methods
  private
    def set_full_address
      self.full_address = "#{self.street}, #{self.city} #{self.zip_code} (#{self.province})"
    end
end
