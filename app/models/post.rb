class Post < ActiveRecord::Base
  validates_presence_of :title, :content, :program_id

  belongs_to :program
  has_many :comments
end
