# frozen_string_literal: true

# Compute color on resistor
module ResistorColorDuo
  @color_map = %w[black brown red orange yellow green blue violet grey white].to_enum.with_index.to_h

  def value(colors)
    colors.take(2).map { |c| @@color_map[c].to_s }.join.to_i
  end
end
