class Post < ActiveRecord::Base
  belongs_to :programs
  has_many :comments
end
