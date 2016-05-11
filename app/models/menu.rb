# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string           not null
#  text_menu     :text
#  html_menu     :text
#  max_price     :decimal(20, 2)   default(0.0)
#  min_price     :decimal(20, 2)   default(0.0)
#  restaurant_id :integer          not null
#

class Menu < ActiveRecord::Base
  # Validations
  validates :title,           presence: true
  validates :restaurant,      presence: true

  # Relations
  has_many :events
  belongs_to :restaurant

  # Callbacks
  before_save :set_text_menu

  # Methods
  private
    def set_text_menu
      self.text_menu = ActionView::Base.full_sanitizer.sanitize(self.html_menu)
    end
end
