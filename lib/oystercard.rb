class Oystercard
  DEFAULT_LIMIT = 90.0
  attr_reader :balance

  def initialize
    @balance = 0.0
  end

  def top_up(amount)
    raise "Cannot exceed #{DEFAULT_LIMIT} limit" if @balance + amount.to_f > DEFAULT_LIMIT
    @balance += amount.to_f
  end

  def deduct(amount)
    @balance -= amount.to_f
  end
end
