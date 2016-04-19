class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :d_title
      t.string :d_type
      t.string :d_tags
      t.attachment :annex
      t.integer :department_id
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
