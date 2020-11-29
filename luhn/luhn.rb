# frozen_string_literal: true

# Luhn algorithm is a simple checksum formula used to validate a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance
class Luhn
  def self.checksum(arr)
    arr.reverse.map.with_index.sum do |v, i|
      (if i.even?
         v
       elsif v < 5
         v * 2
       else
         (v * 2) - 9
       end)
    end
  end

  def self.valid?(str)
    str.gsub!(' ', '')

    return false unless str !~ /\D/
    return false if str.length < 2

    (checksum(str.chars.map(&:to_i)) % 10).zero?
  end

  private_class_method :checksum
end
