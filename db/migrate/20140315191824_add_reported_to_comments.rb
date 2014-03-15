class AddReportedToComments < ActiveRecord::Migration
  def change
    add_column :comments, :reported, :boolean
  end
end
