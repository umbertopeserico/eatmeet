class ActiveSupport::TimeWithZone
  def as_json(options = {})
    strftime('%Y-%m-%dT%l:%M:%S%z')
  end
end