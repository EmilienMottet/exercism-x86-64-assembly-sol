# frozen_string_literal: true

# Hamming : compare strand
class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size

    strand1.each_char.zip(strand2.each_char).count { |a, b| a != b }
  end
end
