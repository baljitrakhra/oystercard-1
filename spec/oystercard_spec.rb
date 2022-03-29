require_relative '../lib/oystercard'

describe Oystercard do
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

  describe '#deduct' do
    it 'should deduct an amount from balance' do
      expect { subject.deduct(30) }.to change { subject.balance }.by(-30.0)
    end
  end

  describe '#in_journey?' do
    it 'should check in use or out of use' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'should change card state to in use' do
      subject.top_up(50)
      expect { subject.touch_in }.to change { subject.in_use }.to(true)
    end

    it 'should raise an error if balance is below minimum fare' do
      expect { subject.touch_in }.to raise_error "Below minimum fare"
    end
  end

  describe '#touch_out' do
    it 'should change card state to out of use' do
      subject.in_use = true
      expect { subject.touch_out }.to change { subject.in_use }.to(false)
    end
  end
end
