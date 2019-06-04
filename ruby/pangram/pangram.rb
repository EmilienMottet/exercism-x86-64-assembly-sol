# frozen_string_literal: true

# Pangram
class Pangram
  def self.pangram?(word)
    alphabet = 'a'..'z'
    word = word.downcase
    alphabet.each do |e|
      return false unless word.include?(e)
    end
    true
  end
end
