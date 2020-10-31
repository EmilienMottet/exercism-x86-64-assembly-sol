defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) do
    Enum.reduce(1..num, [[1]], fn
      1, acc ->
        acc

      line, lines = [previous_line | _t] ->
        new_line =
          ([0] ++ previous_line ++ [0])
          |> Stream.chunk_every(2, 1)
          |> Stream.take(line)
          |> Enum.map(fn [left, right] -> left + right end)

        [new_line | lines]
    end)
    |> Enum.reverse()
  end
end
