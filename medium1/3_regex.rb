# Pig Latin
# Pig Latin is a made-up children's language that's intended to be confusing. It
# obeys a few simple rules (below), but when it's spoken quickly it's really
# difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of
# the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the
# word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants
# too.

# If English isn't your primary language, Pig Latin may seem tricky. For a
# complete discussion of Pig Latin, see this Wikipedia article. You can also
# watch the solution video from about the 3:30 point through about 10:30 without
# having the solution spoiled for you.

# You may find regular expressions (regex) useful for this challenge. If you
# haven't already read our book, Introduction to Regular Expressions, you should
# do so be attempting this problem.

# My notes:
# Iterate through the chars of word,
# if word starts with vowel,
#   add 'ay' to end of word
# if word starts with a consonant,
#   remove all letters until you hit a vowel
#   add 'letters_removed' + 'ay' to end of word
# special rules apply to certain chars:
# 'qu' are always removed together
# 'y' or 'x' in front of a vowel is considered a consonant
# 'y' or 'x' in front of a consonant is considered a vowel

class PigLatin
  def self.translate(words)
    words.split.map do |word|
      transform(word)
    end.join(" ")
  end

  def self.transform(word)
    if word_starts_with_vowel_sound?(word)
      word + 'ay'
    else
      removed_str, word = remove_consonants(word)
      word + removed_str + 'ay'
    end
  end

  def self.word_starts_with_vowel_sound?(word)
    word.match?(/\A[aeiou].*|\Ay[^aeiou].*|\Ax[^aeiou].*/)
  end

  def self.remove_consonants(word)
    removed_str = ""
    until word_starts_with_vowel_sound?(word)
      if word[0] == 'q'
        removed_str += word[0..1]
        word = word[2..-1]
      else
        removed_str += word[0]
        word = word[1..-1]
      end
    end
    [removed_str, word]
  end
end
