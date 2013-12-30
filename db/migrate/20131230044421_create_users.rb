class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.integer :money
      t.integer :karma

      t.timestamps
    end
  end
end
