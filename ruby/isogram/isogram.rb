# frozen_string_literal: true

# Isogram
class Isogram
  def self.isogram?(word)
    word.downcase.gsub(/[^0-9a-z]/i, '').chars.uniq.size \
     == word.downcase.gsub(/[^0-9a-z]/i, '').size
  end
end
