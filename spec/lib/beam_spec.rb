require 'spec_helper'

describe Beam do
  describe 'Instance Methods' do
    describe '#effect' do
      let(:previous_optic) { double alter_x: -1, alter_y: 0 }

      before(:all) do
        @o = described_class.new 1, 2
      end

      it 'initially shoots the beam south' do
        result = @o.effect previous_optic
        expect(result.first).to eq(2)
        expect(result.last).to eq(2)
      end

      it 'initially shoots the beam south' do
        result = @o.effect previous_optic
        expect(result.first).to eq(0)
        expect(result.last).to eq(2)
      end
    end
  end
end
