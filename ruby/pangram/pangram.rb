# frozen_string_literal: true

# Pangram
class Pangram
  ENGLISH_ALPHABET = ('a'..'z').freeze
  def self.pangram?(word)
    word = word.downcase
    ENGLISH_ALPHABET.all? do |l|
      word.include?(l)
    end
  end
end
