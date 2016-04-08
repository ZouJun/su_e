class CreateCodeTables < ActiveRecord::Migration
  def change
    create_table :code_tables do |t|
      t.string :code
      t.string :name
      t.integer :parent_id
      t.text :default_value
      t.datetime :deleted_at
      t.boolean :is_public, default: true

      t.timestamps null: false
    end
  end
end
