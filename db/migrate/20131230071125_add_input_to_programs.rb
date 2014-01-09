class AddInputToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :input, :text
  end
end
