class Journey
  attr_reader :entry_station, :exit_station, :list_of_journeys

  def initialize
    @entry_station = nil
    @exit_station = nil
    @list_of_journeys = []
  end
  
  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def add_journey
    journey = {entry_station: @entry_station, exit_station: @exit_station}
    @list_of_journeys.push(journey)
  end
end