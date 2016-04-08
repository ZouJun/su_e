class Teacher < ActiveRecord::Base
  belongs_to :user
  has_many :students
  has_many :notices
  has_many :messages
  has_many :documents
end
