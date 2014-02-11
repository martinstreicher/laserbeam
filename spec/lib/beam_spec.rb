require 'spec_helper'

describe Beam do
  describe 'Instance Methods' do
    describe '#effect' do

      RSpec.configure do |config|
        config.order_groups_and_examples do |list|
          list.sort_by { |item| item.description }
        end
      end

      let(:previous_optic) { double alter_x: -1, alter_y: 0 }

      before(:all) do
        @o = described_class.new 1, 2
      end

      it 'Run 1: initially shoots the beam south' do
        result = @o.effect previous_optic
        expect(result.first).to eq(2)
        expect(result.last).to eq(2)
      end

      it 'Run 2: later passes through the beam' do
        result = @o.effect previous_optic
        expect(result.first).to eq(0)
        expect(result.last).to eq(2)
      end
    end
  end
end
