defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """

  defp numero(number) when number == 0 do
    "No more"
  end

  defp numero(number) do
    to_string(rem(number + 100, 100))
  end

  defp bottle_s(number) when number != 1 do
    "bottles"
  end

  defp bottle_s(_) do
    "bottle"
  end

  defp bottle(number) do
    numero(number) <> " " <> bottle_s(number)
  end

  defp the_bottle(number) when number > 1 do
    "one"
  end

  defp the_bottle(_) do
    "it"
  end

  defp what_do_you_do(number) when number >= 1 do
    "Take #{the_bottle(number)} down and pass it around"
  end

  defp what_do_you_do(_) do
    "Go to the store and buy some more"
  end

  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{bottle(number)} of beer on the wall, #{String.downcase(bottle(number))} of beer.
    #{what_do_you_do(number)}, #{String.downcase(bottle(number - 1))} of beer on the wall.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    range
    |> Enum.map(fn x ->
      verse(x)
    end)
    |> Enum.join("\n")
  end

  def lyrics do
    lyrics(99..0)
  end
end
