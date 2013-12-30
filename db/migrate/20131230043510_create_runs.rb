class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.text :code
      t.text :output
      t.boolean :success
      t.integer :program_id

      t.timestamps
    end
  end
end
