require_relative 'journey'

class JourneyLog

  attr_reader :journey, :list_of_journeys, :start_journey, :current_journey_var

  def initialize(journey)
    @journey = journey
    @list_of_journeys = []
    @current_journey_var = {entry_station: nil, exit_station: nil}
  end

  def start(station)
    @current_journey_var[:exit_station] = nil
    @current_journey_var[:entry_station] = station
    #@start_journey = Journey.new(station)
    
  end
  
  def finish(station)
    @current_journey_var[:exit_station] = station
    @list_of_journeys.push(@current_journey_var)
    @current_journey_var = {entry_station: nil, exit_station: nil}
    @journey.end_journey(station)
  end

  def journeys
    @list_of_journeys.dup
  end

  def current_journey
    if @current_journey_var[:exit_station] == nil
      @current_journey_var
    else
    @journey = Journey.new()
    end
  end
end