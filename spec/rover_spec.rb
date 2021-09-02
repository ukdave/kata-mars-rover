# frozen_string_literal: true

require "rover"

describe Rover do
  describe "#execute" do
    it "returns the start coords with given an empty list of commands" do
      expect(subject.execute("")).to eq "0:0:N"
    end

    it "executes a sequence of commands and returns the final coordinates + direction" do
      expect(subject.execute("MMRMMLM")).to eq "2:3:N"
    end

    it "wraps around the end of the grid (north)" do
      expect(subject.execute("MMMMMMMMMM")).to eq "0:0:N"
    end

    it "wraps around the end of the grid (east)" do
      expect(subject.execute("RMMMMMMMMMM")).to eq "0:0:E"
    end

    it "wraps around the end of the grid (south)" do
      expect(subject.execute("RRM")).to eq "0:9:S"
    end

    it "wraps around the end of the grid (west)" do
      expect(subject.execute("LM")).to eq "9:0:W"
    end

    it "stops when it reaches an obstacle" do
      grid = Grid.new(obstacles: [[0, 3]])
      rover = described_class.new(grid: grid)
      expect(rover.execute("MMMM")).to eq "O:0:2:N"
    end
  end
end
