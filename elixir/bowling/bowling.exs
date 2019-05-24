defmodule Bowling do
  use GenServer

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """

  @spec start() :: any
  def start do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok)
    pid
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t()
  def roll(game, roll) do
    GenServer.call(game, {:roll, roll})
    game
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t()
  def score(game) do
    GenServer.call(game, :score)
  end

  # Server (callbacks)
  @impl true
  def init(:ok) do
    {:ok, []}
  end

  @impl true
  def handle_call(:score, _from, results) do
    {_, _, score} = results |> Enum.reverse() |> Enum.at(9)
    results |> IO.inspect()
    {:reply, score, results}
  end

  @impl true
  def handle_call({:roll, roll}, _from, results) do
    {score, new_results} = bowling_calculator(roll, results)
    {:reply, score, new_results}
  end

  # strike on first roll
  def bowling_calculator(10, []) do
    {10, [{:strike, [10], 10 }]}
  end

  # first roll
  def bowling_calculator(roll, []) do
    score = roll
    {score, [{:pending, [roll], score}]}
  end

  # strike
  def bowling_calculator(10, [{_, _, score } = previous | results]) do
    {score, [{:strike, [10], score + 10 }, previous | results]}
  end

  # spare
  def bowling_calculator(roll, [{:pending, [last_roll], score} | results])
      when roll + last_roll == 10 do
    new_score = score + roll
    last_frame = {:spare, [last_roll, roll], new_score}
    {new_score, [last_frame | results]}
  end

  # basic roll with a previous
  def bowling_calculator(roll, [
        {:pending, [last_roll], _},
        previous | results
      ]) do
    [ {_, _, previous_score} = previous | results ] = strike_calculator(roll,[previous | results ])
    new_score = previous_score + roll + last_roll
    last_frame = {:done, [last_roll, roll], new_score}
    {new_score, [last_frame, previous | results]}
      end

  # basic roll
  def bowling_calculator(roll, [{:pending, [last_roll], score} | results]) do
    new_score = score + roll
    last_frame = {:done, [last_roll, roll], new_score}
    {new_score, [last_frame | results]}
  end

  def bowling_calculator(roll, [{:strike, [10], score} | results]) do
    score = score + roll
    new_score = score + roll
    new_frame = {:pending, [roll], new_score}
    {new_score, [new_frame, {:strike, [10], score} | results]}
  end

  def bowling_calculator(roll, [{:done, _, score} = last_frame | results]) do
    new_score = score + roll
    new_frame = {:pending, [roll], new_score}
    {new_score, [new_frame, last_frame | results]}
  end

  def bowling_calculator(roll, [{:spare, rolls, score} | results]) do
    score = score + roll
    new_score = score + roll
    last_frame = {:pending, [roll], new_score}
    {new_score, [last_frame, {:spare, rolls, score} | results]}
  end

  def strike_calculator(roll, [ {:strike, [10], score} | results ]) do
    [ {:strike, [10], score + roll} | strike_calculator(roll, results) ]
  end

  def strike_calculator(_,[  previous  | results]) do
    [ previous | results ]
  end

  def strike_calculator(_,[ ]) do
    [ ]
  end
end
