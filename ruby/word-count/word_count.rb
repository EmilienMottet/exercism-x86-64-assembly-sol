# frozen_string_literal: true

# Phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def self.split_words(words)
    words.scan(/[\w]+[w']*[\w]*\b/)
  end

  def word_count
    Phrase.split_words(@phrase.downcase)
          .each_with_object(Hash.new(0)) do |word, h|
      h[word] += 1
    end
  end
end
