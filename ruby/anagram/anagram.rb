class Anagram
  private

  attr_accessor :word, :sorted_word

  def initialize(word)
    @word = word
    @sorted_word = word.downcase.chars.sort
  end

  public

  def match(words)
    words.select do |word|
      word.downcase.chars.sort == sorted_word \
      && word.downcase != @word.downcase
    end
  end
end
