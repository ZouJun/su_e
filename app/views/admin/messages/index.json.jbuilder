json.array!(@admin_messages) do |admin_message|
  json.extract! admin_message, :id, :m_title, :m_content, :n_type, :m_tags
  json.url admin_message_url(admin_message, format: :json)
end
