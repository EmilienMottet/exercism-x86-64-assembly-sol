# give score for a word on Scrabble game
class Scrabble
  TILES = {
    A: 1, N: 1,
    B: 3, O: 1,
    C: 3, P: 3,
    D: 2, Q: 10,
    E: 1, R: 1,
    F: 4, S: 1,
    G: 2, T: 1,
    H: 4, U: 1,
    I: 1, V: 4,
    J: 8, W: 4,
    K: 5, X: 8,
    L: 1, Y: 4,
    M: 3, Z: 10
  }

  def self.score(tiles)
    new(tiles).score
  end

  private

  attr_reader :letters, :tiles

  def initialize(word, tiles = TILES)
    @letters = word.to_s.upcase.chars.map(&:to_sym)
    tiles.default = 0
    @tiles = tiles
  end

  public

  def score
    letters.sum(&tiles)
  end
end
