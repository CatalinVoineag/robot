require "rspec"
require_relative "robot"

RSpec.describe Robot do 
  describe "#move" do
    it "moves to the centre of the grid" do
      commands = ["N", "E", "N", "E", "N", "E", "N", "E" ]
      robot = described_class.new(commands: commands)

      expect { robot.move }.to output("Robot position Y: 4, X: 4\n").to_stdout
    end

    it "moves to the same position that it started" do
      commands = ["N", "E", "S", "W"]
      robot = described_class.new(
        commands: commands,
        starting_y_position: 4,
        starting_x_position: 4
      )

      expect { robot.move }.to output("Robot position Y: 4, X: 4\n").to_stdout
    end


    it "doesn't go out of the grid when going North" do
      commands = ["N", "N"]
      robot = described_class.new(
        commands: commands,
        starting_y_position: 9,
        starting_x_position: 0
      )

      expect { robot.move }.to output("Robot position Y: 9, X: 0\n").to_stdout
    end

    it "doesn't go out of the grid when going South" do
      commands = ["S", "S"]
      robot = described_class.new(
        commands: commands,
        starting_y_position: 0,
        starting_x_position: 0
      )

      expect { robot.move }.to output("Robot position Y: 0, X: 0\n").to_stdout
    end

    it "doesn't go out of the grid when going West" do
      commands = ["W", "W"]
      robot = described_class.new(
        commands: commands,
        starting_y_position: 0,
        starting_x_position: 0
      )

      expect { robot.move }.to output("Robot position Y: 0, X: 0\n").to_stdout
    end

    it "doesn't go out of the grid when going East" do
      commands = ["E", "E"]
      robot = described_class.new(
        commands: commands,
        starting_y_position: 0,
        starting_x_position: 9
      )

      expect { robot.move }.to output("Robot position Y: 0, X: 9\n").to_stdout
    end
  end
end
