class Notice < ActiveRecord::Base
  belongs_to :department
  belongs_to :user, class_name: 'User', foreign_key: 'teacher_id'
  belongs_to :department, class_name: 'User', foreign_key: 'department_id'

  def department?
    department_id.present?
  end

  def user?
    teacher_id.present?
  end
end
