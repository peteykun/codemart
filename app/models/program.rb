class Program < ActiveRecord::Base
  belongs_to :user
  has_many :runs

  validates_presence_of :name, :statement, :output, :input, :reward
  validates_inclusion_of :solved, in: [true, false]

  after_initialize :default_values

  private
    def default_values
      self.solved ||= false
    end
end
