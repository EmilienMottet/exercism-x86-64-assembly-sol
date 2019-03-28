defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position)
      when direction != :north and direction != :south and direction != :east and
             direction != :west do
    {:error, "invalid direction"}
  end

  def create(_direction, position)
      when not is_tuple(position) or tuple_size(position) != 2 or
             not is_integer(elem(position, 0)) or
             not is_integer(elem(position, 1)) do
    {:error, "invalid position"}
  end

  def create(direction, position) do
    %{:position => position, :direction => direction}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @r_map %{:north => :east, :east => :south, :south => :west, :west => :north}
  @l_map %{:north => :west, :east => :north, :south => :east, :west => :south}
  @a_map %{:north => {0,1}, :east => {1,0}, :south => {0,-1}, :west => {-1 , 0}}
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, "R" <> instructions) do
    dir = robot[:direction]

    simulate(Map.put(robot, :direction, @r_map[dir]), instructions)
  end

  def simulate(robot, "L" <> instructions) do
    dir = robot[:direction]

    simulate(Map.put(robot, :direction, @l_map[dir]), instructions)
  end

  def simulate(robot, "A" <> instructions) do
    {x, y} = robot[:position]
    {a, b} = @a_map[robot[:direction]]

    simulate(Map.put(robot, :position, {x + a, y + b}), instructions)
  end

  def simulate(robot, "") do
    robot
  end

  def simulate(_robot, _instructions) do
    {:error, "invalid instruction"}
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end
end
