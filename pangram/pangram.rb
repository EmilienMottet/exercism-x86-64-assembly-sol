# frozen_string_literal: true

# module Language for Pangram
module Language
  ALPHABET = %w[
    a z e r t y u i o p
    q s d f g h j k l m
    w x c v b n
  ].freeze

  # Extend String class
  refine String do
    def pangram?
      word = downcase
      ALPHABET.all? do |l|
        word.include?(l)
      end
    end
  end
end

# Pangram
class Pangram
  using Language
  def self.pangram?(word)
    word.pangram?
  end
end
