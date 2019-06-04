# frozen_string_literal: true

# Gigasecond
class Gigasecond

  ONE_GIGASECOND = 10**9

  def self.from(date)
    date + ONE_GIGASECOND
  end
end
