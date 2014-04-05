class User < ActiveRecord::Base
  validates_presence_of :username
  validates_uniqueness_of :username
  
  has_many :programs
  has_many :comments
  has_and_belongs_to_many :purchased_comments, class_name: 'Comment', join_table: 'buyers_purchased_comments'
  
  has_many :debit_transactions,   foreign_key: 'from_id',   class_name: 'Transaction'
  has_many :credit_transactions,  foreign_key: 'to_id',     class_name: 'Transaction'

  has_secure_password

  def transactions
    debit_ids = self.debit_transactions.pluck(:id)
    credit_ids = self.credit_transactions.pluck(:id)

    Transaction.where('id IN (?) OR id in (?)', debit_ids, credit_ids)
  end

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
