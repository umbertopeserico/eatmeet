class RestaurantOwner < ActiveRecord::Base
  # Validations
  validates :name,            presence: true
  validates :surname,         presence: true
  validates :email,           presence: true,
                              uniqueness: { case_sensitive: false }

  # Callbacks
  before_save :set_full_name

  # Methods

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  private
    def set_full_name
      self.full_name = "#{self.name} #{self.surname}"
    end
end
