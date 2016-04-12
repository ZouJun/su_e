class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :messages
  has_many :documents

  has_one :user, as: :owner
end
