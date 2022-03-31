require_relative 'journey'

class JourneyLog

  attr_reader :journey, :list_of_journeys, :start_journey

  def initialize(journey)
    @journey = journey
    @list_of_journeys = []
  end

  def start(station)
    @start_journey = Journey.new(station)
  end
end