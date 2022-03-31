require_relative '../lib/journeylog.rb'

describe JourneyLog do
  describe '#initalises' do
    let(:journeylog) { JourneyLog.new(Journey.new(nil))}

    it ' create a new journeylog' do
      # journey_l = JourneyLog.new
      expect(journeylog).to be_an_instance_of(JourneyLog) 
    end
    it "creates a new Journey instance when initialized" do
      p journeylog = JourneyLog.new(Journey.new(nil))
      expect(journeylog.journey).to be_an_instance_of(Journey)
    end
    it 'creates a list of journey and at start it hould be empty' do
      expect(journeylog.list_of_journeys).to eq []
    end
  end
  
  context '#start_journey' do
    let(:entry_station) {double :station}
    let(:journeylog) { JourneyLog.new(Journey.new(nil))}
    it 'starts a journey' do
      expect(journeylog.start(entry_station)).to eq journeylog.current_journey_var[:entry_station]
    end
  end
  context "#current journey" do
    let(:entry_station) {double :station}
    let(:exit_station) { double :station}
    let(:journeylog) { JourneyLog.new(Journey.new(entry_station)) }
    it "returns an incomplete journey" do
      journeylog.start(entry_station)
      expect(journeylog.current_journey).to eq(entry_station: entry_station, exit_station: nil)
    end
    # xit 'returns a complete journey' do
    #   journeylog.start(entry_station)
    # end
  end

  context '#finishing_journey'do
    let(:entry_station) {double :station}
    let(:exit_station) { double :station}
    let(:journeylog) { JourneyLog.new(Journey.new(nil)) }
    it 'add an exit station to current journey' do
      p journeylog.current_journey[:exit_station]
      expect(journeylog.finish(exit_station)).to eq(journeylog.current_journey_var[:exit_station])
    end
  end
end
