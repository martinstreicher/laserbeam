require 'spec_helper'

describe Optic do
  subject { described_class.new 10, 20 }

  describe 'Class Methods' do
    describe '.new' do
      it 'initializes x and y' do
        expect(subject.x).to eq(10)
        expect(subject.y).to eq(20)
      end

      it 'raises an exception if x is less than zero' do
        expect { Optic.new -1, 0 }.to raise_exception
      end

      it 'raises an exception if y is less than zero' do
        expect { Optic.new 0, -1 }.to raise_exception
      end

      it 'raises an exception if x is not an integer' do
        expect { Optic.new 1.9, 0 }.to raise_exception
      end

      it 'raises an exception if y is not an integer' do
        expect { Optic.new 0, 2.0 }.to raise_exception
      end
    end
  end

  describe 'Instance Methods' do
  end
end
