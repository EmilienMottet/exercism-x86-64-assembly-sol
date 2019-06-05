# frozen_string_literal: true

# Pangram
class Pangram
  ENGLISH_ALPHABET = ('a'..'z').freeze
  def self.pangram?(word)
    word = word.downcase
    ENGLISH_ALPHABET.all? do |e|
      word.include?(e)
    end
  end
end
