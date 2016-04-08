class CodeTable < ActiveRecord::Base
  has_many :children, class_name: 'CodeTable', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'CodeTable', foreign_key: 'parent_id'

  # paranoid

  def self.value(id)
    ct = find_by(id: id)
    ct.default_value if ct.present?
  end

  def set_value(value)
    update_attributes default_value: value
  end

  def self.get(id)
    CodeTable.find(id)
  end

  def self.get_list(ids)
    CodeTable.where(id: ids)
  end

  def self.get_children(id)
    CodeTable.joins(:parent).where('parents_code_tables.id = ?', id)
  end

  def self.create_on_not_exists(*args)
    CodeTable.create *args unless CodeTable.with_deleted.exists? id: args.first[:id]
  end
end
