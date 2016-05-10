class Menu < ActiveRecord::Base
  # Validations
  validates :title,           presence: true
  validates :restaurant,      presence: true

  # Relations
  belongs_to :restaurant

  # Callbacks
  before_save :set_text_menu

  # Methods
  private
    def set_text_menu
      self.text_menu = ActionView::Base.full_sanitizer.sanitize(self.html_menu)
    end
end
