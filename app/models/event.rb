class Event < ActiveRecord::Base
  # Validations
  validates :title,             presence: true
  validates :schedule,          presence: true
  validates :menu,              presence: true
  validates :max_people,        presence: true
  validates :min_people,        presence: true
  validates :people_min_price,  presence: true

  # Relations
  has_and_belongs_to_many :users
  belongs_to :menu

end
