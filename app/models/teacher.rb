class Teacher < ActiveRecord::Base
  has_many :students, :dependent => :destroy
  has_many :notices, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_one :user, as: :owner

  validates :t_number, uniqueness: true
  validates :email, uniqueness: true
end
