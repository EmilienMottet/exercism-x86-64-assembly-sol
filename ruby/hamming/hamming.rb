# frozen_string_literal: true

# Hamming : compare strand
class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size

    strand1.chars.zip(strand2.chars).count { |a, b| a != b }
  end
end
