json.array!(@admin_teachers) do |admin_teacher|
  json.extract! admin_teacher, :id, :t_number, :t_name, :t_password, :academy, :major, :age, :sex, :email, :address, :telephone, :t_power, :ip
  json.url admin_teacher_url(admin_teacher, format: :json)
end
