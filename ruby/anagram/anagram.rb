class Anagram
  private

  attr_accessor :word, :computed_word

  def compute_word(word)
    word.downcase.chars.sort
  end

  def initialize(word)
    @word = word
    @computed_word = compute_word(word)
  end

  public

  def match(*words)
    words.flatten.reject { |w| w.downcase == @word.downcase }.select do |w|
      compute_word(w) == computed_word
    end
  end
end
