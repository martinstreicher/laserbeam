require 'spec_helper'

describe Reader do
  describe 'Class Methods' do
    describe '.read' do
      it 'converts the entire file to a string' do
        filename = File.expand_path("../../fixtures/files/3x3_steps5.txt", __FILE__)
        result = described_class.read filename
        expect(result).to eq("@-v\n---\n-->\n")
      end
    end
  end
end