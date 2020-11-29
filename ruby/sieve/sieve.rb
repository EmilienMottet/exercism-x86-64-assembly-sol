# frozen_string_literal: true

# Sieve
class Sieve
  def initialize(end_range)
    @primes = []
    @range = *(2..end_range)
  end

  def primes
    while @range != []
      @primes.push(@range[0])
      @range = @range.reject { |number| (number % @range[0]).zero? }
    end
    @primes
  end
end
