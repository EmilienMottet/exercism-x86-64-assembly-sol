# frozen_string_literal: true

# Complement
class Complement
  CONVERT_MAP = { 'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U' }.freeze

  def self.of_dna(dna)
    dna.each_char.map { |e| CONVERT_MAP[e] }.sum('')
  end
end
