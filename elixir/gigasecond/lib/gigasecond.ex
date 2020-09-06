defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          :calendar.datetime()

  def from(dt = {{year, month, day}, {hours, minutes, seconds}}) do
    gigasecond = :math.pow(10, 9) |> round
    dt |> NaiveDateTime.from_erl!() |> NaiveDateTime.add(gigasecond) |> NaiveDateTime.to_erl()
  end
end
