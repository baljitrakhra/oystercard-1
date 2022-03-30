class Journey
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end
  
  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)

  end
end