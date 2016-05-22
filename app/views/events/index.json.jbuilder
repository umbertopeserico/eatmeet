json.array!(@events) do |event|
  json.extract! event,  :id, :title, :schedule, :max_people, :min_people, :people_min_price,
                        :max_price, :min_price, :actual_price, :menu
  json.url event_url(event, format: :json)
end
