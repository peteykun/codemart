class Run < ActiveRecord::Base
  belongs_to     :program
  before_save    :test
  before_destroy :prevent_destroy_if_success

  validates_presence_of :code, :output, :program

  def test
    self.success = check

    if self.success
      p = self.program
      u = p.user
      
      u.lock!

      unless program.solved
        u.money += program.reward 
        t = Transaction.new
        t.debitor = nil
        t.credited = u
        t.amount = program.reward
        t.description = "Solved the program: " + program.name
        t.save
      end
      p.solved = true

      p.save
      u.save!
    end

    true
  end

  def prevent_destroy_if_success
    true
    false if self.success
  end

  private
    def check
      run_words = self.output.split
      expected_words = self.program.output.split

      if run_words.length != expected_words.length
        return false
      end

      n = run_words.length

      for i in 0...n do
        begin
          expected_number = Float(expected_words[i])
          run_number = Float(run_words[i])

          return false unless (expected_number - run_number).abs <= 0.001
        rescue ArgumentError => e
          return false unless run_words[i] == expected_words[i]
        end
      end

      return true
    end
end
