json.array!(@admin_students) do |admin_student|
  json.extract! admin_student, :id, :s_number, :s_name, :s_passowrd, :academy, :major, :age, :sex, :email, :address, :telephone, :s_power, :ip
  json.url admin_student_url(admin_student, format: :json)
end
