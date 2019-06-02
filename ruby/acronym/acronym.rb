# frozen_string_literal: true

# Acronym Class
class Acronym
  def self.abbreviate(sentence)
    sentence.scan(/\b[[:alpha:]]/).join.upcase
  end
end
