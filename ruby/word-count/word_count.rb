# frozen_string_literal: true

# Phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    split_words
      .each_with_object(Hash.new(0)) do |word, h|
      h[word] += 1
    end
  end

  private

  def split_words
    @phrase.downcase.scan(/[\w]+[w']*[\w]*\b/)
  end
end
