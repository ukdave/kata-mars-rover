# frozen_string_literal: true

class Grid
  attr_reader :size

  def initialize size: 10, obstacles: []
    @size = size
    @obstacles = obstacles
  end

  def obstacle? x, y
    @obstacles.include?([x, y])
  end
end
