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

class User < ActiveRecord::Base
  # Validations
  validates :name,              presence: true
  validates :surname,           presence: true
  validates :email,             presence: true,
                                uniqueness: { case_sensitive: false }

  # Relations
  has_and_belongs_to_many :events

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
