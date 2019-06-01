# frozen_string_literal: true

# HighScores
class HighScores
  def initialize(args)
    @scores = args
  end

  attr_reader :scores

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.max(3)
  end
end
