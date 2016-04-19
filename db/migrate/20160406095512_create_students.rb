class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :s_number
      t.string :s_name
      t.string :s_password
      t.string :academy
      t.string :major
      t.integer :age
      t.string :sex
      t.string :email
      t.string :address
      t.string :telephone
      t.integer :s_power
      t.attachment :info_file
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
