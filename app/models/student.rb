
class Student < ActiveRecord::Base
  belongs_to :teacher
  has_many :messages, :dependent => :destroy
  has_many :documents, :dependent => :destroy
  has_one :user, as: :owner
  has_one :grade
  validates :s_number, uniqueness: true
  validates :email, uniqueness: true

  def self.import(file)
    csv = file.open
    fields = csv.readline.split(',')
    csv.readlines.each do |line|
      info= line.chomp.utf8!.split(',')
      student = Student.new
      fields.each_with_index do |field, index|
        field = field.chomp
        student[field.to_sym] = info[index]
      end
      student.user = User.create! name: student.s_name, password: student.s_password
      student.save!
    end

  end
end
