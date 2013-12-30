class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.text :statement
      t.text :output
      t.boolean :solved
      t.integer :reward
      t.integer :user_id

      t.timestamps
    end
  end
end
