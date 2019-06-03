# frozen_string_literal: true

# Squares
class Squares
  def initialize(number)
    @num = number
  end

  def square_of_sum
    (1..@num).sum.pow(2)
  end

  def sum_of_squares
    (1..@num).map { |e| e.pow(2) }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
