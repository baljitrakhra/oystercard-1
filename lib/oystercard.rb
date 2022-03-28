class Oystercard
  DEFAULT_LIMIT = 90.0
  MINIMUM_FARE = 1.0
  attr_reader :balance
  attr_accessor :state

  def initialize
    @balance = 0.0
    @state = "out of use"
  end

  def top_up(amount)
    raise "Cannot exceed #{DEFAULT_LIMIT} limit" if @balance + amount.to_f > DEFAULT_LIMIT
    @balance += amount.to_f
  end

  def deduct(amount)
    @balance -= amount.to_f
  end

  def in_journey?
    @state == "in use" ? true : false
  end

  def touch_in
    raise "Below minimum fare" if @balance < MINIMUM_FARE
    @state = "in use"
  end

  def touch_out
    @state = "out of use"
  end
end
