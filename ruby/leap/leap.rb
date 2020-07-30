# frozen_string_literal: true

# Year
class Year
  def self.leap?(year)
    (year % 4).zero? && ((year % 400).zero? || (year % 100).nonzero?)
  end
end
