class Zone < ActiveRecord::Base
  # Validations
  validates :name,      presence: true,
                        uniqueness: { case_sensitive: false }

  # Relations
  has_and_belongs_to_many :restaurants
end