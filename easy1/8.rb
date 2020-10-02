# Word Count
# Write a program that given a phrase can count the occurrences of each word in
# that phrase.

# For example, if we count the words for the input "olly olly in come free", we
# should get:

# olly: 2
# in: 1
# come: 1
# free: 1

# P
# My notes from test cases:
# - method should return a hash {'word' => number}
# - all words should be downcased
# - a word is defined as any number of alphanumerics
# - other characters are not allowed as a part of a word, except a ' flanked by
#   alphanumerics

# E
# given

# D
# string, array, hash

# A
# - initialize empty result_arr
# - initialize empty result_hash
# - downcase input string
# - scan input string for any words
#   - need a method to detect a word from string
# - if a word is found
#   - add to result_arr
# - iterate through result_arr
#   - for current word, check if result_hash already has it as key
#     - if not, add it with a value of 1
#     - else, add 1 to its value
# - return result_hash

# - method to detect a word from string:
# - String#scan
# - regex pattern: /\b[a-z0-9']+\b/

# str = "Joe can't tell between 'large' and large."
# arr = str.scan(/\b[a-z0-9']+\b/)
# p arr

# class Phrase
#   def initialize(str)
#     @str = str.downcase
#   end

#   def word_count
#     result_hash = {}
#     result_arr = @str.scan(/\b[a-z0-9']+\b/)
#     result_arr.each do |word|
#       if result_hash.key?(word)
#         result_hash[word] += 1
#       else
#         result_hash[word] = 1
#       end
#     end
#     result_hash
#   end
# end

# # refactored:
# class Phrase
#   def initialize(str)
#     @str = str.downcase
#   end

#   def word_count
#     result_hash = {}
#     result_arr = @str.scan(/\b[a-z0-9']+\b/)
#     result_arr.each do |word|
#       result_hash.key?(word) ? result_hash[word] += 1 : result_hash[word] = 1
#     end
#     result_hash
#   end
# end

# # refactored:
# class Phrase
#   def initialize(str)
#     @str = str.downcase
#   end

#   def word_count
#     result_arr = @str.scan(/\b[a-z0-9']+\b/)
#     result_arr.each_with_object({}) do |word, hash|
#       hash.key?(word) ? hash[word] += 1 : hash[word] = 1
#     end
#   end
# end

# phrase = Phrase.new('word')
# counts = { 'word' => 1 }
# p counts ==  phrase.word_count

# Further Exploration
# All 3 of the provided solutions have a small problem: if a word ends with an
# apostrophe (for instance, Louis' classroom), they will strip the apostrophe
# instead of including it in the word. Write a test to check for this condition,
# and use it to test your own program. If necessary, fix your code so it keeps
# the trailing apostrophes.

# My notes: only keep a trailing apostrophe if the start of the word did not
# have it

# Change algorithm so that you include all words with apostrophes in the
# result_arr but then exclude the right apostrophes from words before iterating
# to add words to hash

class Phrase
  def initialize(str)
    @str = str.downcase
  end

  def word_count
    arr = word_list(@str)
    arr.each_with_object({}) do |word, hash|
      hash.key?(word) ? hash[word] += 1 : hash[word] = 1
    end
  end

  private

  def word_list(str)
    result_arr = str.scan(/'*\b[a-z0-9']+\b'*/)
    result_arr.map! do |word|
      word[0] == "'" && word[-1] == "'" ? word[1..-2] : word
    end
  end
end

phrase = Phrase.new("Louis' classroom was 'tacky'")
counts = {
  "louis'" => 1, "classroom" => 1, "was" => 1, "tacky" => 1
}
p counts == phrase.word_count
