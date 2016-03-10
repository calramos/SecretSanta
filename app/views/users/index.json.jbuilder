json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :wishlist
  json.url user_url(user, format: :json)
end
