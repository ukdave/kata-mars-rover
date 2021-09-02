# frozen_string_literal: true

require "grid"

class Rover
  DIRECTIONS = %w[N E S W].freeze

  def initialize grid: Grid.new
    @x = 0
    @y = 0
    @direction = "N"
    @grid = grid
  end

  def execute command
    obstacle = false
    command.chars.each do |instruction|
      unless process(instruction)
        obstacle = true
        break
      end
    end
    "#{obstacle ? 'O:' : ''}#{@x}:#{@y}:#{@direction}"
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
    true
  end

  def move
    new_x, new_y = @x, @y
    case @direction
    when "N"
      new_y = (@y + 1) % @grid.size
    when "E"
      new_x = (@x + 1) % @grid.size
    when "S"
      new_y = (@y - 1) % @grid.size
    when "W"
      new_x = (@x - 1) % @grid.size
    end
    return false if @grid.obstacle?(new_x, new_y)

    @x, @y = new_x, new_y
    true
  end
end
