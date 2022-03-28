require_relative '../lib/oystercard'

describe Oystercard do
  it 'starts with a balance of 0.0' do
    expect(subject.balance).to eq 0.0
  end

  it 'should add an amount to balance' do
    expect { subject.top_up(30) }.to change { subject.balance }.by(30.0)
  end

  it 'should limit the card to default limit' do
    expect { subject.top_up(100) }.to raise_error "Cannot exceed #{Oystercard::DEFAULT_LIMIT} limit"
  end

  it 'should deduct an amount from balance' do
    expect { subject.deduct(30) }.to change { subject.balance }.by(-30.0)
  end

  it 'should check in use or out of use' do
    expect(subject.in_journey?).to eq false
  end

  it 'should change card state to in use' do
    expect { subject.touch_in }.to change { subject.state }.to("in use")
  end

  it 'should change card state to out of use' do
    subject.state = "in use"
    expect { subject.touch_out }.to change { subject.state }.to("out of use")
  end
end
