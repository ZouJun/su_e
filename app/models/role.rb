class Role < ActiveRecord::Base
  has_and_belongs_to_many :permissions

  def self.create_on_not_exists(*args)
    Role.create *args unless Role.exists? id: args.first[:id]
  end
end
