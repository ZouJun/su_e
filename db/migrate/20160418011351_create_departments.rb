class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :d_number
      t.string :d_name
      t.string :d_password
      t.string :academy
      t.string :major
      t.integer :age
      t.string :sex
      t.string :email
      t.string :address
      t.string :telephone
      t.integer :d_power
      t.integer :student_id
      t.integer :notice_id
      t.integer :message_id
      t.integer :document_id

      t.timestamps null: false
    end
  end
end
