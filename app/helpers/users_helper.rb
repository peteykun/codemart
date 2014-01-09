module UsersHelper
  def assign_programs(user)
    rewards = Program.all.pluck(:reward).uniq

    rewards.each do |r|
      p = Program.where(reward: r, user_id: nil).sample
      p.user = user
      p.save
    end
  end
end
