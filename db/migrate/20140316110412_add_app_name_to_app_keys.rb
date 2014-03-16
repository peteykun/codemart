class AddAppNameToAppKeys < ActiveRecord::Migration
  def change
    add_column :app_keys, :app_name, :string
  end
end
