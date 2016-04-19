json.array!(@admin_departments) do |admin_department|
  json.extract! admin_department, :id, :d_number, :d_name, :d_password, :academy, :major, :age, :sex, :email, :address, :telephone, :d_power
  json.url admin_department_url(admin_department, format: :json)
end
