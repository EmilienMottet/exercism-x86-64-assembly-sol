# frozen_string_literal: true

# SumOfMultiples
class SumOfMultiples
  def initialize(*args)
    @target = args
  end

  def to(end_range)
    (1..(end_range - 1)).sum do |number|
      @target.any? { |t| (number % t).zero? } ? number : 0
    end
  end
end
