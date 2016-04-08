
json.count @users.length

json.items @users.each do |user|
  json.extract! user, :id, :name, :phone, :email, :account
end
