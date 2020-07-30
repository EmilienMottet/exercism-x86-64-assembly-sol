# frozen_string_literal: true

# Isogram
class Isogram
  def self.isogram?(word)
    clean_word = word.downcase.gsub(/[^0-9a-z]/i, '')
    clean_word.chars.uniq.size == clean_word.size
  end
end
