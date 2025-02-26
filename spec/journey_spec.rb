require_relative '../lib/journey'
require_relative '../lib/oystercard'
describe Journey do 
  let(:double_entry_station) {double :station}
  let(:double_exit_station) {double :station}
  let(:card) {Oystercard.new}

  describe '#journey creation' do
  
    it ' has a entry station at start' do
    subject = Journey.new(double_entry_station)
    expect(subject.entry_station).to eq double_entry_station 
    end
  end
  describe '#completing itself' do
    it ' except an exit station' do
      subject.end_journey(double_exit_station)
      expect(subject.exit_station).to eq double_exit_station 
    end
  end
  describe '#completeness checks' do
    it 'when there is an entery station and an exit station' do
      subject = Journey.new(double_entry_station)
      subject.end_journey(double_exit_station)
      expect(subject.entry_station).to eq nil
    end
    it {is_expected.to respond_to(:complete?)}
  end
  
  describe '#fare' do
    let(:subject) {Journey.new(double_entry_station)}
    
    it 'calcualte fare for journey' do
      subject.end_journey(double_exit_station)
      expect(subject.fare).to eq Oystercard::MINIMUM_FARE
    end
    it 'if you forget to touch out you get a penality' do
      expect(subject.fare).to eq Journey::PENALITY_FARE
    end

  end
  # describe '#list_of_journeys' do
  #   let (:station_entry) {double 'entry station'}
  #   let (:station_exit) {double 'exit station'}
  #   let (:journey) {{entry_station: station_entry, exit_station: station_exit}}
  
      # it 'gives an empty array by default' do
      #   expect(subject.list_of_journeys).to eq []
      # end
  
      # it 'stores a journey' do
      #   jj = Journey.new(station_entry)
      #   jj.end_journey(station_exit)
      #   expect(jj.list_of_journeys).to include journey
      #   expect(jj.list_of_journeys.length).to eq 1
      # end
    # end 
end
