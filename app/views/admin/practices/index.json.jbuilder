json.array!(@admin_practices) do |admin_practice|
  json.extract! admin_practice, :id, :p_name, :post, :address, :telephone, :memento
  json.url admin_practice_url(admin_practice, format: :json)
end
