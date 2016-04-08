class Permission < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :group, foreign_key: 'group_id', class_name: 'CodeTable'

  def self.create_on_not_exists(*args)
    unless Permission.exists? id: args.first[:id]
      Permission.create *args
    else
      Permission.find(args.first[:id])
    end
  end
end
