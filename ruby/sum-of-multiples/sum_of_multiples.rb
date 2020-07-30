# frozen_string_literal: true

# SumOfMultiples
class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end

  def to(end_range)
    (1...end_range).sum do |number|
      @multiples.any? { |t| (number % t).zero? } ? number : 0
    end
  end
end
