json.array!(@admin_documents) do |admin_document|
  json.extract! admin_document, :id, :d_title, :d_content, :d_type, :d_tags, :annex
  json.url admin_document_url(admin_document, format: :json)
end
