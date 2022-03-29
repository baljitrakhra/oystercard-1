class Oystercard
  DEFAULT_LIMIT = 90.0
  MINIMUM_FARE = 1.0
  attr_reader :balance, :in_use

  def initialize
    @balance = 0.0
    @in_use = false
  end

  def top_up(amount)
    raise "Cannot exceed #{DEFAULT_LIMIT} limit" if @balance + amount.to_f > DEFAULT_LIMIT
    @balance += amount.to_f
  end

  def in_journey?
    @in_use
  end

  def touch_in
    raise "Below minimum fare" if @balance < MINIMUM_FARE
    @in_use = true
  end

  def touch_out
    self.deduct(MINIMUM_FARE)
    @in_use = false
  end

  private

  def deduct(amount)
    @balance -= amount.to_f
  end
end
