require 'spec_helper'

describe OpticFactory do
  describe 'Class Methods' do
    describe '.place' do
      it 'builds a north optic' do
        o = described_class.place('^', 1, 2)
        expect(o.is_a?(North)).to be_true
        result = o.effect
        expect(result.first).to eq(1)
        expect(result.last).to eq(1)
      end
    end
  end
end