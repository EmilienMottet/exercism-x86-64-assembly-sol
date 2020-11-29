# frozen_string_literal: true

# Complement
class Complement
  CONVERT_MAP = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }.freeze

  def self.of_dna(dna)
    dna.each_char.sum('') { |e| CONVERT_MAP[e] }
  end
end
