require_relative 'journey'

class JourneyLog

  attr_reader :journey, :list_of_journeys, :start_journey

  def initialize(journey)
    @journey = journey
    @list_of_journeys = []
    @current_journey = {entry_station: nil, exit_station: nil}
  end

  def start(station)
    @start_journey = Journey.new(station)
    @current_journey[:entry_station] = station
  end


  def current_journey
    if @current_journey[:exit_station] == nil
      @current_journey
    else
    @journey = Journey.new()
    end
  end
end