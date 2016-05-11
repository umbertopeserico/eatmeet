class Event < ActiveRecord::Base
  # Validations
  validates :title,             presence: true
  validates :schedule,          presence: true
  validates :menu,              presence: true
  validates :max_people,        presence: true
  validates :min_people,        presence: true
  validates :people_min_price,  presence: true
  # Relations
  belongs_to :menu

end
