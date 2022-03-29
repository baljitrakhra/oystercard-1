class Oystercard
  DEFAULT_LIMIT = 90.0
  MINIMUM_FARE = 1.0
  attr_reader :balance, :entry_station

  def initialize( station = nil)
    @balance = 0.0
    @entry_station = station
  end

  def top_up(amount)
    raise "Cannot exceed #{DEFAULT_LIMIT} limit" if @balance + amount.to_f > DEFAULT_LIMIT
    @balance += amount.to_f
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Below minimum fare" if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    self.deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount.to_f
  end
end
