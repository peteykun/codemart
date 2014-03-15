class User < ActiveRecord::Base
  has_many :programs
  has_many :comments

  has_secure_password

  def is_admin?
    return false
  end

  def score
    return karma * money
  end
end
