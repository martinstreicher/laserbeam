require 'spec_helper'

describe North do
  describe 'Instance Methods' do
    it 'changes the beam north' do
      o = described_class.new(1, 2)
      result = o.effect
      expect(result.first).to eq(0)
      expect(result.last).to eq(2)
    end
  end
end
