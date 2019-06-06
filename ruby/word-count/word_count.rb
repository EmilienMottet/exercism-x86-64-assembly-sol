# frozen_string_literal: true

# Phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.scan(/[\w]+[w']*[\w]*\b/).each_with_object(Hash.new(0)) do |w, h|
      h[w.downcase] += 1
    end
  end
end
