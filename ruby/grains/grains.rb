# frozen_string_literal: true

# Grain
class Grains
  CHESSBOARD = (1..64).freeze

  def self.square(index)
    raise ArgumentError unless CHESSBOARD.cover?(index)

    2**(index - 1)
  end

  def self.total
    (1..64).sum { |i| square(i) }
  end
end
