class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.integer :position

      t.timestamps null: false
    end

    create_table :role_permissions do |t|
      t.integer :role_id
      t.integer :permission_id
    end

    create_table :user_roles do |t|
      t.integer :user_id
      t.integer :role_id
    end
  end
end
