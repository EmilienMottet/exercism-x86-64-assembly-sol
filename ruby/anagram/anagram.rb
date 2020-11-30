class Anagram
  private

  attr_accessor :given, :computed_given

  def compute_word(word)
    word.downcase.chars.sort
  end

  def normalized(words)
    words = words.map { |w| [w, compute_word(w)] }.to_h
    words.delete_if { |w, _n| w.casecmp(given).zero? }
    words
  end

  def initialize(word)
    @given = word
    @computed_given = compute_word(given)
  end

  public

  def match(*words)
    abecedarian = normalized(words.flatten)
    abecedarian.select do |_w, n|
      n == computed_given
    end.keys
  end
end
