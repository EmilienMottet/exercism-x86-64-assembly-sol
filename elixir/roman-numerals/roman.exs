defmodule Roman do

	@pow %{1 => "I", 10 => "X", 100 => "C", 1000 => "M" }
  
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    pow = 1..3
    |> Enum.reverse
    |> Enum.map fn pow ->
      numerals(rem(number,:math.pow(10,pow) |> round ),pow)
    end

  end

  def numerals(number,pow) when number < 4 do
    String.duplicate(@pow[pow],number)
  end

  def numerals(number,pow) do
    number
  end

end
