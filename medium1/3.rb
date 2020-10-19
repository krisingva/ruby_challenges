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

# algo:
# - initialize vowel_arr, consonant_arr
# -iterate through word char_arr with index
#   -if current char is a vowel
#     return index
# - use index to remove chars from 0 to index of word, save as removed-str
# - add removed_str + 'ay' to end of word

class PigLatin
  VOWELS = %w(a e i o u)
  CONSONANT = ("a".."z").to_a - VOWELS - ['q', 'y']

  def self.translate(words)
    words.split.map do |word|
      removal_idx = get_removal_idx(word)
      if removal_idx == nil || removal_idx == 0
        word + 'ay'
      else
        removed_str = word.slice!(0...removal_idx)
        word + removed_str + 'ay'
      end
    end.join(" ")
  end

  def self.get_removal_idx(word)
    word.each_char do |char|
      if char == 'y' || char == 'x'
        xy_index = word.index(char)
        if CONSONANT.include?(word[xy_index + 1])
          return 0
        else
          return (xy_index + 1)
        end
      elsif VOWELS.include?(char)
        return word.index(char)
      elsif char == 'q'
        return word.index(char) + 2
      end
    end
  end
end

# p PigLatin.translate('pig')
# p PigLatin.translate('koala')
# p PigLatin.translate('urmomlol')