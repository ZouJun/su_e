class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :s_number
      t.string :s_name
      t.string :s_passowrd
      t.string :academy
      t.string :major
      t.integer :age
      t.string :sex
      t.string :email
      t.string :address
      t.string :telephone
      t.integer :s_power
      t.string :ip
      t.integer :admin_id
      t.integer :teacher_id
      t.integer :message_id
      t.integer :document_id

      t.timestamps null: false
    end
  end
end
