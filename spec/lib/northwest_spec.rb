require 'spec_helper'

describe Northwest do
  describe 'Instance Methods' do
    describe '#effect' do
      let(:o) { described_class.new 1, 2 }

      it 'sends an eastward beam south' do
        previous = double alter_x: 0, alter_y: 1
        result = o.effect previous
        expect(result.first).to eq(2)
        expect(result.last).to eq(2)
      end

      it 'sends a northward beam to the west' do
        previous = double alter_x: -1, alter_y: 0
        result = o.effect previous
        expect(result.first).to eq(1)
        expect(result.last).to eq(1)
      end

      it 'sends an westward beam north' do
        previous = double alter_x: 0, alter_y: -1
        result = o.effect previous
        expect(result.first).to eq(0)
        expect(result.last).to eq(2)
      end

      it 'sends a southward beam to the east' do
        previous = double alter_x: 1, alter_y: 0
        result = o.effect previous
        expect(result.first).to eq(1)
        expect(result.last).to eq(3)
      end
    end
  end
end
