class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :ordinary_grade
      t.string :item_grade
      t.string :reply_grade
      t.integer :student_id
      t.boolean :verify, default: false

      t.timestamps null: false
    end
  end
end
