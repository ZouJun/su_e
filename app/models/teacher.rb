class Teacher < ActiveRecord::Base
  has_many :students, :dependent => :destroy
  has_many :notices, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_one :user, as: :owner

  validates :t_number, uniqueness: true, presence: true, length: { is: 11}
  validates :email, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                                               message: "only allows letters" }
  validates :t_power, numericality: { greater_than: 0, less_than: 3}
  validates :t_name, :t_password, :academy, :major, :age, :sex, :address, :telephone, presence: true
end
