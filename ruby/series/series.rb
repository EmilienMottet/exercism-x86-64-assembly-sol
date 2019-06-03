# frozen_string_literal: true

# Series
class Series
  def initialize(string_seq)
    @seq = string_seq
  end

  def slices(order)
    raise ArgumentError if order > @seq.size

    i = 0
    slices = []
    while i + order <= @seq.size
      slices << @seq.slice(i, order)
      i += 1
    end
    slices
  end
end
