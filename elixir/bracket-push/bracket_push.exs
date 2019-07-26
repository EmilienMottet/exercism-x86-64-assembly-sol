defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> to_charlist
    |> Enum.reduce_while([], fn
      ?\}, [?\{ | acc] ->
        {:cont, acc}

      ?\}, _ ->
        {:halt, false}

      ?\], [?\[ | acc] ->
        {:cont, acc}

      ?\], _ ->
        {:halt, false}

      ?\), [?\( | acc] ->
        {:cont, acc}

      ?\), _ ->
        {:halt, false}

      ?\(, acc ->
        {:cont, [?\( | acc]}

      ?\{, acc ->
        {:cont, [?\{ | acc]}

      ?\[, acc ->
        {:cont, [?\[ | acc]}

      _, acc ->
        {:cont, acc}
    end) == []
  end
end
