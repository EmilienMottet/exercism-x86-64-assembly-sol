# frozen_string_literal: true

# Gigasecond
class Gigasecond
  GIGASECOND = 10**9

  def self.from(time)
    time + GIGASECOND
  end
end
