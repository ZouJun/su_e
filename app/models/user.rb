class User < ActiveRecord::Base
  has_many :notices, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  validates :phone, uniqueness: true, allow_blank: true, allow_nil: true
  validates :email, uniqueness: true, allow_nil: true, allow_blank: true

  belongs_to :owner, polymorphic: true

  attr_accessor :login
  #角色
  has_and_belongs_to_many :roles, dependent: :delete_all
  has_many :permissions, through: :roles, class_name: 'Permission'

  def teacher?
    self.owner_type == 'Teacher'
  end

  def student?
    self.owner_type == 'Student'
  end

  def department?
    self.owner_type == 'Department'
  end

  def email_required?
    false
  end

  # 设置用户登录验证密码的规则
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(name) = :value OR lower(phone) = :value OR lower(email) = :value', {:value => login.downcase}]).first
    else
      where(conditions.to_h).first
    end
  end
end
