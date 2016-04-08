json.array!(@admin_grades) do |admin_grade|
  json.extract! admin_grade, :id, :score, :verify
  json.url admin_grade_url(admin_grade, format: :json)
end
