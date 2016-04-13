class CreateResetPasswords < ActiveRecord::Migration
  def change
    create_table :reset_passwords do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
