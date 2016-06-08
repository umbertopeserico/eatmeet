class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :meta, :created_at, :updated_at

  def meta
    a = Hash.new
    a[:events_count] = object.events_count
    a
  end
end
