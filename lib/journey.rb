class Journey
  attr_reader :entry_station, :exit_station, :PENALITY_FARE, :list_of_journeys
  PENALITY_FARE = 6
  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
    @list_of_journeys = []
  end

  def end_journey(station)
    @exit_station = station
    add_journey
    @entry_station = nil
  end

  def complete?
    entry_station == nil ? true : false
  end

  def fare
    complete?
    if complete?
      Oystercard::MINIMUM_FARE
    else 
      PENALITY_FARE
    end
  end

  private
  
  def add_journey
    journey = {entry_station: @entry_station, exit_station: @exit_station}
    @list_of_journeys.push(journey)
  end

end