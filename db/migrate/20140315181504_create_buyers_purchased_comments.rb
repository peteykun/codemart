class CreateBuyersPurchasedComments < ActiveRecord::Migration
  def change
    create_table :buyers_purchased_comments do |t|
      t.integer :user_id
      t.integer :comment_id
    end
  end
end
