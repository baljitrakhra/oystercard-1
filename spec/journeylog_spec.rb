require_relative '../lib/journeylog.rb'
describe JourneyLog do
  describe '#initalises' do
    it ' create a new journelog' do
      # journey_l = JourneyLog.new
      expect(subject).to be_an_instance_of(JourneyLog) 
    end
  end
end