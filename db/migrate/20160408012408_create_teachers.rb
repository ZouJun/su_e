class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :t_number
      t.string :t_name
      t.string :t_password
      t.string :academy
      t.string :major
      t.integer :age
      t.string :sex
      t.string :email
      t.string :address
      t.string :telephone
      t.integer :t_power
      t.string :ip
      t.integer :admin_id
      t.integer :student_id
      t.integer :notice_id
      t.integer :message_id
      t.integer :document_id

      t.timestamps null: false
    end
  end
end
