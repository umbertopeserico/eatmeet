class Restaurant < ActiveRecord::Base
  # Validations
  validates :name,            presence: true
  validates :email,           presence: true,
                              uniqueness: { case_sensitive: false }

  # Relations
  belongs_to :restaurant_owner

  # Callbacks
  before_save :set_full_address

  # Methods
  private
    def set_full_address
      self.full_address = "#{self.street}, #{self.city} #{self.zip_code} (#{self.province})"
    end
end
