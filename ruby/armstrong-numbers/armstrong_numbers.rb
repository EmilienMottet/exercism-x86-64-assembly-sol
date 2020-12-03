class ArmstrongNumbers
  def self.include?(number)
    number_str = number.to_s
    number_str.chars.sum { |c| c.to_i**number_str.size } == number
  end
end
