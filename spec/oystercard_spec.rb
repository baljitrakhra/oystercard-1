require_relative '../lib/oystercard'

describe Oystercard do
  context "#balance" do
    it { is_expected.to respond_to :balance }

    it 'starts with a balance of 0.0' do
      expect(subject.balance).to eq 0.0
    end
  end
end
