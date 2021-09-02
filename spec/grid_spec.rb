# frozen_string_literal: true

require "grid"

describe Grid do
  describe "#obstacle?" do
    subject { described_class.new(obstacles: [[1, 2], [3, 3]]) }

    it "returns true when there is an obstacle at the specified coordinates" do
      expect(subject.obstacle?(1, 2)).to eq true
      expect(subject.obstacle?(3, 3)).to eq true
    end

    it "returns false when there is not an obstacle at the specified coordinates" do
      expect(subject.obstacle?(0, 0)).to eq false
      expect(subject.obstacle?(4, 5)).to eq false
    end
  end
end
