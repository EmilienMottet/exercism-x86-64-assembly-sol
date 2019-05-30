class Acronym
  def self.abbreviate(sentence)
    sentence.split(/\W+/).map { |word| word[0].upcase }.join
  end
end
