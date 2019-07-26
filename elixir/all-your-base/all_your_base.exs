defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) do
    n = digits |> Enum.with_index |> Enum.map( fn {v , i} -> v * (:math.pow(base_a,i) |> round ) end ) |> Enum.sum
  end
end
