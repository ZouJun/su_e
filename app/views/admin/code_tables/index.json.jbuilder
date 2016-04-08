json.array!(@admin_code_tables) do |admin_code_table|
  json.extract! admin_code_table, :id, :name, :code, :parent_id, :default_value, :deleted_at, :is_public
  json.url admin_code_table_url(admin_code_table, format: :json)
end
