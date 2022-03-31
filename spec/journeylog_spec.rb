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
  end
end
