json.array!(@categories) do |category|
  json.extract! category, :id, :name
  json.url api_category_url(category, format: :json)
end
