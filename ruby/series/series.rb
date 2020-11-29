# frozen_string_literal: true

# Series
class Series
  def initialize(string_seq)
    @seq = string_seq.chars
  end

  def slices(order)
    raise ArgumentError if order > @seq.size

    @seq.each_cons(order).map(&:join)
  end
end
