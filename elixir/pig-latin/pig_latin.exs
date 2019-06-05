defmodule PigLatin do
  @vowel ["a", "e", "i", "o", "u"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate("a" <> _ = word) do
    rule_1(word)
  end

  def translate("e" <> _ = word) do
    rule_1(word)
  end

  def translate("i" <> _ = word) do
    rule_1(word)
  end

  def translate("o" <> _ = word) do
    rule_1(word)
  end

  def translate("u" <> _ = word) do
    rule_1(word)
  end

  def translate("qu" <> _ = word) do
    rule_1(word)
  end

  def translate("p" <> end_word) do
    rule_2(end_word, "p")
  end

  def translate("k" <> end_word) do
    rule_2(end_word, "k")
  end

  def translate("y" <> end_word) do
    rule_2(end_word, "y")
  end

  def translate("x" <> end_word) do
    rule_2(end_word, "x")
  end

  def translate("q" <> end_word) do
    if end_word |> String.first() do
      rule_2(end_word, "q")
    end
  end

  def translate("q" <> end_word) do
    if end_word |> String.first() do
      rule_2(end_word, "q")
    end
  end

  def translate(word) do
    if word |> Enum.slice(0, 2) |> Enum.all(fn x -> x not in @vowel end) do
      {begin_word,end_word} = word |> Enum.split_while(fn x -> x not in @vowel end) |> IO.inspect
      rule_2( end_word , begin_word )
    end
  end

  defp rule_1(word) do
    word <> "ay"
  end

  defp rule_2(end_word, letters) do
    end_word <> letters <> "ay"
  end
end
