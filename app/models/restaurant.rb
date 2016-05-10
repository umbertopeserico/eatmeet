class Restaurant < ActiveRecord::Base
  # Relations
  belongs_to :restaurant_owner
end
