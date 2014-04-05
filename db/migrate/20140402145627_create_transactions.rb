class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
