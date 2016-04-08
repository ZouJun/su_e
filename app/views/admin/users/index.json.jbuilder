json.total_count @users.length

json.items @users.map do |user|
  json.extract! user, :id, :name, :phone, :email, :account
  json.url admin_user_url(user, format: :json)
end