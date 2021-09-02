# frozen_string_literal: true

class Rover
  DIRECTIONS = %w[N E S W].freeze

  def initialize grid_size: 10
    @x = 0
    @y = 0
    @direction = "N"
    @grid_size = grid_size
  end

  def execute command
    command.chars.each {|instruction| process(instruction) }
    "#{@x}:#{@y}:#{@direction}"
  end

  private

  def process instruction
    case instruction
    when "L"
      turn(-1)
    when "R"
      turn(1)
    when "M"
      move
    end
  end

  def turn step
    dir_index = DIRECTIONS.find_index(@direction)
    dir_index = (dir_index + step) % DIRECTIONS.length
    @direction = DIRECTIONS[dir_index]
  end

  def move
    case @direction
    when "N"
      @y = (@y + 1) % @grid_size
    when "E"
      @x = (@x + 1) % @grid_size
    when "S"
      @y = (@y - 1) % @grid_size
    when "W"
      @x = (@x - 1) % @grid_size
    end
  end
end
