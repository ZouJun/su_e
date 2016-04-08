json.array!(@admin_notices) do |admin_notice|
  json.extract! admin_notice, :id, :n_title, :n_content, :unit, :n_type, :n_tags, :views
  json.url admin_notice_url(admin_notice, format: :json)
end
