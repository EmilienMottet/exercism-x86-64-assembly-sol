# frozen_string_literal: true

# Acronym Class
class Acronym
  def self.abbreviate(sentence)
    sentence.scan(/\b[a-zA-Z]/).map(&:upcase).join
  end
end
