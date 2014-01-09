class Post < ActiveRecord::Base
  belongs_to :program
  has_many :comments
end
