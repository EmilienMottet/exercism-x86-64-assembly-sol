# frozen_string_literal: true

# Grain
class Grains
  GRAIN_MIN = 1
  GRAIN_MAX = 64

  def self.square(index)
    raise ArgumentError unless (GRAIN_MIN..GRAIN_MAX).cover?(index)

    2**(index - 1)
  end

  def self.total
    (1..64).sum { |i| square(i) }
  end
end
