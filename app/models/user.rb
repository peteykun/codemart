class User < ActiveRecord::Base
  has_many :programs
  has_many :comments

  has_secure_password
end
