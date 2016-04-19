class Department < ActiveRecord::Base
  has_many :students
  has_many :notices
  has_many :messages
  has_many :documents

  has_one :user, as: :owner

  validates :d_number, uniqueness: true, presence: true, length: { is: 11}
  validates :email, uniqueness: true, presence: true, format: { with: /.*/,
                                                                message: "only allows letters" }
  validates :d_power, numericality: { greater_than: 0, less_than: 2}
  validates :d_name, :d_password, :academy, :major, :age, :sex, :address, :telephone, presence: true

end
