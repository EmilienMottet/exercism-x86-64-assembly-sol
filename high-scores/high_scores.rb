# frozen_string_literal: true

# HighScores
class HighScores
  attr_reader :scores
  def initialize(args)
    @scores = args
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top_three
    scores.max(3)
  end
end
