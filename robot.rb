require "byebug"

class Robot
  attr_reader :commands, :y_position, :x_position
  private :commands, :y_position, :x_position

  VERTICAL_GRID = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  HORIZONTAL_GRID = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

  def initialize(commands:, y_position: 0, x_position: 0) 
    @commands = commands
    @y_position = y_position
    @x_position = x_position
  end

  def move
    current_y_position = y_position
    current_x_position = x_position

    commands.each do |command|
      case command
      when "N"
        next if current_y_position == VERTICAL_GRID.last

        current_y_position = VERTICAL_GRID[VERTICAL_GRID.find_index(current_y_position) + 1]
      when "W"
        next if current_x_position == HORIZONTAL_GRID.first

        current_x_position = HORIZONTAL_GRID[HORIZONTAL_GRID.find_index(current_x_position) - 1]
      when "E"
        next if current_x_position == HORIZONTAL_GRID.last

        current_x_position = HORIZONTAL_GRID[HORIZONTAL_GRID.find_index(current_x_position) + 1]
      when "S"
        next if current_y_position == VERTICAL_GRID.first

        current_y_position = VERTICAL_GRID[VERTICAL_GRID.find_index(current_y_position) - 1]
      end
    end

    puts "Robot position Y: #{current_y_position}, X: #{current_x_position}"
  end
end

commands = ["N", "E", "N", "E", "N", "E", "N", "E" ]
Robot.new(commands: commands).move
