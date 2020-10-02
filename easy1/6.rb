# Anagrams
# Write a program that, given a word and a list of possible anagrams, selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists"
# "google" "inlets" "banana" the program should return a list containing
# "inlets". Please read the test suite for exact rules of anagrams.

# P:
# - input: a single word (only alphas), array of test words
# - output: array of test words that are anagrams of input word
# rules:
# - an anagram can not be the same word as the given word
# - an anagram is case insensitive
#   - example: 'Orchestra' and 'Carthorse' are anagrams
#   - example: 'corn' and 'Corn' are not anagrams
# E:
# - given
# D:
# - array, string
# A:
# - initialize results as empty array
# - iterate through test word array
# - for current test word
#   - if input word downcased is the same as test word downcased
#     - next
#   - if input word downcased chars sorted is the same as test word downcased
#     chars sorted
#     - add test word to results
# C:

# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(test_words)
#     results = []
#     test_words.each do |test|
#       if @word.downcase == test.downcase
#         next
#       elsif @word.downcase.chars.sort == test.downcase.chars.sort
#         results << test
#       end
#     end
#     results
#   end
# end

# refactored:
# class Anagram
#   def initialize(word)
#     @word = word
#   end

#   def match(test_words)
#     test_words.each_with_object([]) do |test, results|
#       if @word.downcase == test.downcase
#         next
#       elsif @word.downcase.chars.sort == test.downcase.chars.sort
#         results << test
#       end
#     end
#   end
# end

# # without using #sort:
# class Anagram
#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(test_words)
#     word_count = letter_count(@word)
#     test_words.each_with_object([]) do |test, results|
#       if @word == test.downcase
#         next
#       elsif word_count == letter_count(test)
#         results << test
#       end
#     end
#   end

#   def letter_count(word)
#     word.downcase.chars.each_with_object({}) do |char, count|
#       count.has_key?(char)? count[char] += 1 : count[char] = 1
#     end
#   end
# end

# rubocop fixes:
class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(test_words)
    word_count = letter_count(@word)
    test_words.each_with_object([]) do |test, results|
      if (@word != test.downcase) && (word_count == letter_count(test))
        results << test
      end
    end
  end

  def letter_count(word)
    word.downcase.chars.each_with_object({}) do |char, count|
      count.key?(char) ? count[char] += 1 : count[char] = 1
    end
  end
end

# LS:
# class Anagram
#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(words)
#     words.select { |word| anagrams?(word) }
#   end

#   def anagrams?(word)
#     word.downcase != @word &&
#     word.downcase.chars.sort == @word.chars.sort
#   end
# end
