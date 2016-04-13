class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :teacher
  belongs_to :student

  has_attached_file :annex, default_url: "/annex"
  validates_attachment_content_type :annex, content_type: /.*/
end
