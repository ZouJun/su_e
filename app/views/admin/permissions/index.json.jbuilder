json.array!(@admin_permissions) do |admin_permission|
  json.extract! admin_permission, :id, :description, :action, :subject, :fetching, :code, :position, :group_id
  json.url admin_permission_url(admin_permission, format: :json)
end
