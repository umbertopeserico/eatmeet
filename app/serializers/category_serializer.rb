class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :meta, :created_at, :updated_at

  def meta
    a = Hash.new
    a[:events_count] = object.events_count
    a
  end

  def image
    if PaperclipConfig.storage != :s3
      Settings.app_url + ApplicationController.helpers.asset_url(object.image.url(:thumb))
    else
      object.image.url
    end
  end
end
