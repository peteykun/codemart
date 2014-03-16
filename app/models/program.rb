class Program < ActiveRecord::Base
  belongs_to :user
  has_many :runs

  validates_presence_of :name, :statement, :output, :input, :solved, :reward
end
