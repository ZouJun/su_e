class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :teacher
  has_many :messages
  has_many :documents
end
