Settings =
  if Rails.env.production?
    OpenStruct.new(
      :app_url => 'http://eatmeet.herokuapp.com/'
    )
  else
    OpenStruct.new(
      :app_url => 'http://lvh.me:3000/'
    )
  end
