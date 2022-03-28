class Oystercard
  attr_reader :balance

  def initialize
    @balance = 0.0
  end

  def top_up(amount)
    @balance += amount.to_f
  end
end
