json.array!(@users) do |user|
  json.extract! user, :id, :name, :surname, :full_name, :email, :password, :password_confirmation
  json.url user_url(user, format: :json)
end
