class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :m_title
      t.string :m_content
      t.string :m_type
      t.string :m_tags
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
