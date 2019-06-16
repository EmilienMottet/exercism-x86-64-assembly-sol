# frozen_string_literal: true

# Raindrops
class Raindrops
  RAIN_CONVERTER = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    res = RAIN_CONVERTER.map { |k, v| v if (number % k).zero? }.join
    if res == ''
      number.to_s
    else
      res
    end
  end
end
