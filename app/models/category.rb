# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

class Category < ActiveRecord::Base
  # Relations
  has_attached_file :image, {
                      styles: { medium: "128x128>", thumb: "64x64>" },
                      default_url: ':style/missing.png',
                    }.merge(PaperclipConfig.to_h)

  has_and_belongs_to_many :events

  # Validations
  validates :name,          presence: true,
            uniqueness: { case_sensitive: false }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Methods
  def events_count
    events.count
  end
end
