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
    it ' when you touchout of a station' do
      card.touch_out(station)
      expect(journey.end_journey(station)).to eq journey.exit_station
    end
  end
end