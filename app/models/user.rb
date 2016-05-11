# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  surname                :string           not null
#  full_name              :string
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
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
