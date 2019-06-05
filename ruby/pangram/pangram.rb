# frozen_string_literal: true

# Pangram
class Pangram
  ALPHABET = %w|
    a z e r t y u i o p
    q s d f g h j k l m
    w x c v b n
    |
  def self.pangram?(word)
    word = word.downcase
    ALPHABET.all? do |l|
      word.include?(l)
    end
  end
end
