class Comment < ActiveRecord::Base
  validates_presence_of :content, :user_id, :post_id

  belongs_to :user
  belongs_to :post
  has_and_belongs_to_many :buyers, class_name: 'User', join_table: 'buyers_purchased_comments'

  after_initialize :init

  def init
    self.price ||= 0
    self.reported ||= false
  end

  def have_rights?(user)
    user == self.user or self.price == 0 or self.buyers.include?(user)
  end
end
