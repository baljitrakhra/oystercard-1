require_relative '../lib/oystercard'

describe Oystercard do
  let(:card) { Oystercard.new}

  describe '#balance' do
    it 'starts with a balance of 0.0' do
      expect(subject.balance).to eq 0.0
    end
  end

  describe '#top_up' do
    it 'should add an amount to balance' do
      expect { subject.top_up(30) }.to change { subject.balance }.by(30.0)
    end

    it 'should limit the card to default limit' do
      expect { subject.top_up(100) }.to raise_error "Cannot exceed #{Oystercard::DEFAULT_LIMIT} limit"
    end
  end

  describe '#in_journey?' do
    it 'should check in use or out of use' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    let (:station) {double :station}

    it {is_expected.to respond_to(:touch_in).with(1).argument}

    it 'should change card state to in use' do
      card.top_up(50)
      expect { card.touch_in(station) }.to change{card.entry_station}.to station 
    end

    it 'should raise an error if balance is below minimum fare' do
      expect { subject.touch_in(station) }.to raise_error "Below minimum fare"
    end

  end

  describe '#touch_out' do
    let (:station) {double :station}
    before do
      subject.top_up(30)
      subject.touch_in(station)
      
    end

    it 'should change card state to out of use' do
      expect { subject.touch_out }.to change { subject.in_journey? }.to(false)
    end

    it 'should deduct the minimum fare' do
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end
end
