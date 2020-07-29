defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(coins, target) do
    coins = coins |> Enum.sort() |> Enum.reverse()
    case do_generate(coins, target, []) do
      nil -> {:error, "cannot change"}
      res -> {:ok, res}
    end
  end

  defguardp is_new_best?(current,candidate) when length(candidate) < length(current) or ( length(candidate) == length(current) and candidate < current )

  def do_generate(_coins, 0, acc) do
    acc |> Enum.sort()
  end
  def do_generate([], _target, _acc) do
    nil
  end

  def do_generate(coins, target, result) do
    result ++ coins
    |> Enum.reduce([], fn coin, acc ->
      count = div(target,coin)
      acc ++ List.duplicate(coin, count)
      do_generate(coins, target, acc)
    end)
  end
end
