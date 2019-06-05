# frozen_string_literal: true

# Pangram
class Pangram
  def self.pangram?(word)
    word.pangram?
  end
end

# Extend String class
class String
  ALPHABET = %w[
    a z e r t y u i o p
    q s d f g h j k l m
    w x c v b n
  ].freeze
  def pangram?
    word = downcase
    ALPHABET.all? do |l|
      word.include?(l)
    end
  end
end
