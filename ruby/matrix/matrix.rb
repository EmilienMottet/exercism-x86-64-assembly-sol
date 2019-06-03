# frozen_string_literal: true

# Matrix
class Matrix
  def initialize(args)
    lines = args.each_line
    n = lines.count
    @matrix = Array.new(n) { Array.new(n) }
    lines.each_with_index do |line, i|
      line.split.each_with_index { |cell, j| @matrix[i][j] = cell.to_i }
    end
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end
end
