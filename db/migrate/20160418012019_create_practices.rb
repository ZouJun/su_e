class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.string :p_name
      t.string :post
      t.string :address
      t.string :telephone
      t.string :memento
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
