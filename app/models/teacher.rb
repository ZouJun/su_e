class Teacher < ActiveRecord::Base
  has_many :students
  has_many :notices
  has_many :messages
  has_many :documents
  has_one :user, as: :owner

  validates :s_number, uniqueness: true
  validates :email, uniqueness: true
end
