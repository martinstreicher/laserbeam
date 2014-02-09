require 'spec_helper'

describe Room do
  describe 'Class Methods' do
    let(:r) { "--\n--" }
    let(:s) { "<---\n----\n@^V/<" }
    let(:t) { "<---\n----\n@VV--\n" }
    let(:t) { "<<<- \n-  ---\n@^V//   \n" }

    describe '.new' do
      it 'creates a 2x2 room' do
        nr = Room.new r
        expect(nr.height).to eq(2)
        expect(nr.width).to eq(2)
      end

      it 'creates a 4x4 room' do
        nr = Room.new s
        expect(nr.height).to eq(3)
        expect(nr.width).to eq(4)
      end

      it 'ignores blank interlineated chaarecters' do
        nr = Room.new t
        expect(nr.height).to eq(3)
        expect(nr.width).to eq(4)
      end

      it 'ignores trailing and leading spaces' do
        nr = Room.new t
        expect(nr.height).to eq(3)
        expect(nr.width).to eq(4)
       end
    end
  end

  describe 'Instance Methods' do

  end
end
