json.array!(@reset_passwords) do |reset_password|
  json.extract! reset_password, :id
  json.url reset_password_url(reset_password, format: :json)
end
