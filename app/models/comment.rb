class Comment < ActiveRecord::Base
  validates_presence_of :content, :user_id, :post_id

  belongs_to :user
  belongs_to :post
end
