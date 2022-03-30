class Oystercard
  DEFAULT_LIMIT = 90.0
  MINIMUM_FARE = 1.0
  attr_reader :balance, :in_use, :exit_station, :list_of_journeys

  def initialize()
    @balance = 0.0
    @in_use = false
    @exit_station = nil
    @list_of_journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Cannot exceed #{DEFAULT_LIMIT} limit" if @balance + amount.to_f > DEFAULT_LIMIT
    @balance += amount.to_f
  end

  def in_journey?
    @in_use
    #@entry_station != nil
  end

  def touch_in(station)
    raise "Below minimum fare" if @balance < MINIMUM_FARE
    jj = Journey.new
    jj.start_journey(station)
    @in_use = true
    #@entry_station = station
  end

  def touch_out(station)
    self.deduct(MINIMUM_FARE)
    @exit_station = station
    add_journey
    @in_use = false
    #@entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount.to_f
  end

  def add_journey
    journey = {entry_station: @entry_station, exit_station: @exit_station}
    list_of_journeys.push(journey)
  end
end
