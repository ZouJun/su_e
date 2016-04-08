class CreateDebugs < ActiveRecord::Migration
  def change
    create_table :debugs do |t|
      t.string :message
      t.text :backtrace
      t.integer :user_id
      t.string :ip
      t.string :source

      t.timestamps null: false
    end
  end
end
