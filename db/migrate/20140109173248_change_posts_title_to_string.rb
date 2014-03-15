class ChangePostsTitleToString < ActiveRecord::Migration
  def self.up
    change_column :posts, :title, :string
  end

  def self.down
    change_column :posts, :title, :text
  end
end
