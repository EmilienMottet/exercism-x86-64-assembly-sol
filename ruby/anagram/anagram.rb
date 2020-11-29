# frozen_string_literal: true

# Anagram
class Anagram
  def initialize(word)
    @word = word
    @sorted_word = word.downcase.chars.sort
  end

  def match(list_word)
    list_word.select do |a_word|
      a_word.downcase.chars.sort == @sorted_word \
      && a_word.downcase != @word.downcase
    end
  end
end
