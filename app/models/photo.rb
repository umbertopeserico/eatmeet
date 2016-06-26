class Photo < ActiveRecord::Base
  # Relations
  has_attached_file :image, {
      styles: { medium: "128x128>", thumb: "64x64>" },
      default_url: ':style/missing.png',
  }.merge(PaperclipConfig.to_h)

  belongs_to :imageable, polymorphic: true

  # Validations
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
