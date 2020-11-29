# frozen_string_literal: true

# Compute color on resistor
class ResistorColorDuo
  @color_map = %w[black brown red orange yellow green blue violet grey white].to_enum.with_index.to_h

  def self.value(colors)
    colors.take(2).map { |c| @color_map[c] }.join.to_i
  end
end
