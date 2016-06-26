class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :image, :meta, :created_at, :updated_at

  def meta
    a = Hash.new
  end

  def image
    if PaperclipConfig.storage != :s3
      Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
    else
      if object.image_file_name.nil?
        Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
      else
        object.image.url()
      end
    end
  end

  def image_medium
    if PaperclipConfig.storage != :s3
      Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
    else
      if object.image_file_name.nil?
        Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
      else
        object.image.url(:medium)
      end
    end
  end

  def image_thumb
    if PaperclipConfig.storage != :s3
      Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
    else
      if object.image_file_name.nil?
        Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
      else
        object.image.url(:thumb)
      end
    end
  end
end
