class CreateAppKeys < ActiveRecord::Migration
  def change
    create_table :app_keys do |t|
      t.string :key

      t.timestamps
    end
  end
end
