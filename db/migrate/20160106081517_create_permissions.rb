class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :description
      t.string :action
      t.string :subject
      t.string :fetching
      t.string :code
      t.integer :group_id
      t.integer :position

      t.timestamps null: false
    end
  end
end
