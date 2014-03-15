class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username
  
  has_many :programs
  has_many :comments

  has_secure_password

  def is_admin?
    return false
  end

  def score
    return karma * money
  end
  
  # Dangerous, call only ONCE!
  def assign_programs()
    return if self.programs.count > 0

    rewards = Program.all.pluck(:reward).uniq

    rewards.each do |r|
      p = Program.where(reward: r, user_id: nil).sample
      p.user = self
      p.save
    end
  end
end
