require 'spec_helper'

describe Mirror do
  describe 'Instance Methods' do
    describe '#effect' do
      let(:o) { described_class.new 1, 2 }

      it 'reverses the beam north if traveling south' do
        previous = double alter_x: 1, alter_y: 0
        result = o.effect previous
        expect(result.first).to eq(0)
        expect(result.last).to eq(2)
      end

      it 'reverses the beam south if traveling north' do
        previous = double alter_x: -1, alter_y: 0
        result = o.effect previous
        expect(result.first).to eq(2)
        expect(result.last).to eq(2)
      end

      it 'reverses the beam east if traveling west' do
        previous = double alter_x: 0, alter_y: -1
        result = o.effect previous
        expect(result.first).to eq(1)
        expect(result.last).to eq(3)
      end

      it 'reverses the beam west if traveling east' do
        previous = double alter_x: 0, alter_y: 1
        result = o.effect previous
        expect(result.first).to eq(1)
        expect(result.last).to eq(1)
      end
    end
  end
end
