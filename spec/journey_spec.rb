require_relative '../lib/journey'
require_relative '../lib/oystercard'

describe Journey do
  let (:journey) { Journey.new } 
  let (:card) { Oystercard.new }

  describe '#start_journey' do
    let (:station) { double :station }

    it { is_expected.to respond_to(:start_journey).with(1).argument }

    it 'should start the journey' do
      card.top_up(10)
      card.touch_in(station)
      expect(journey.start_journey(station)).to eq journey.entry_station 
    end
  end

  describe '#end_journey' do
    
    let (:station) { double :station }

    it {is_expected.to respond_to(:end_journey).with(1).argument}
    
    it 'when you touchout of a station' do
      card.touch_out(station)
      expect(journey.end_journey(station)).to eq journey.exit_station
    end
  end

  describe '#list_of_journeys' do
  let (:station_entry) {double :station}
  let (:station_exit) {double :station}
  let (:trip) {{entry_station: station_entry, exit_station: station_exit}}

    it 'gives an empty array by default' do
      expect(journey.list_of_journeys).to eq []
    end

    it 'stores a journey' do
      card.top_up(30)
      card.touch_in(station_entry)
      card.touch_out(station_exit)
      # expect(journey.list_of_journeys).to include trip
      # expect(journey.list_of_journeys).to_not be_empty
      expect(journey.list_of_journeys.length).to eq 1
    end
  end
end