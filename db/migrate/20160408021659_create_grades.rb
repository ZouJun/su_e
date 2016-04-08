class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :score
      t.boolean :verify, default: false
      t.integer :admin_id
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
