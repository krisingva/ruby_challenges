# Scrabble Score
# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values
# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# Examples
# "cabbage" should be scored as worth 14 points:

# 3 points for C
# 1 point for A, twice
# 3 points for B, twice
# 2 points for G
# 1 point for E

# And to total:

# 3 + 2*1 + 2*3 + 2 + 1
# = 3 + 2 + 6 + 3
# = 5 + 9
# = 14

class Scrabble
  attr_reader :word

  def initialize(word)
    word = "" if word.nil?
    @word = word.upcase
  end

  POINTS = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  def score
    return 0 if word.empty?

    word.each_char.with_object([]) do |char, score|
      POINTS.each do |k, v|
        score << k if v.include?(char)
      end
    end.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
