class Document < ActiveRecord::Base
  belongs_to :user
  belongs_to :teacher
  belongs_to :student
end
