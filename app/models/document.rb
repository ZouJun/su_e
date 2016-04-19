class Document < ActiveRecord::Base
  belongs_to :department
  belongs_to :teacher
  belongs_to :student
  # mount_uploader :attachment, AttachmentUploader

  has_attached_file :annex, default_url: "/annex"
  validates_attachment_content_type :annex, content_type: /.*/
end
