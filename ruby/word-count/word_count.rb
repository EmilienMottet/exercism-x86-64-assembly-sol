# frozen_string_literal: true

# Phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase.scan(/[\w]+[w']*[\w]*\b/)
  end

  def word_count
    @phrase.each_with_object(Hash.new(0)) do |word, h|
      h[word.downcase] += 1
    end
  end
end
