require 'spec_helper'

describe Room do
  let(:r) { "--\n--" }
  let(:s) { "@---\n----\n>---" }
  let(:t) { " <---\n----\n@v--\n" }
  let(:u) { "<<<- \n-  ---\n^v/@   \n" }
  let(:e) { "<<<- \n-  ----\n^v/@   \n" }

  describe 'Class Methods' do
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
        nr = Room.new u
        expect(nr.height).to eq(3)
        expect(nr.width).to eq(4)
      end

      it 'detects errors in the room spec' do
        expect { Room.new e }.to raise_exception
      end
    end
  end

  describe 'Instance Methods' do
    describe '#fire' do
      it { expect { Room.new(r).fire }.to raise_exception }
      it { puts s; expect(Room.new(s).fire).to eq(4) }
    end

    describe '#laser' do
      it { expect(Room.new(r).laser).to be_nil }
      it { room = Room.new(s); expect([room.laser.x, room.laser.y]).to eq([0, 0]) }
      it { room = Room.new(t); expect([room.laser.x, room.laser.y]).to eq([2, 0]) }
      it { room = Room.new(u); expect([room.laser.x, room.laser.y]).to eq([2, 3]) }
    end
  end
end
