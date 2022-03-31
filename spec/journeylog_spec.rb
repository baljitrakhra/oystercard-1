require_relative '../lib/journeylog.rb'

describe JourneyLog do
  describe '#initalises' do
    let(:journeylog) { JourneyLog.new(Journey.new(nil))}

    it ' create a new journelog' do
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
      expect(journeylog.start(entry_station)).to eq journeylog.start_journey
    end
  end

end
