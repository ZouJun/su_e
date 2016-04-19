class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :n_title
      t.string :n_content, limit: 6000
      t.string :n_type
      t.string :n_tags
      t.integer :views
      t.integer :department_id
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
