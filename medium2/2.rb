# Wordy
# Write a program that takes a word problem and returns the answer as an
# integer.

# E.g.

# What is 5 plus 13?

# The program should return 18.

# What is 7 minus 5 minus 1?

# The program should return 1.

# Remember, that these are verbal word problems, not treated as you normally
# would treat a written problem. This means that you calculate as you move
# forward each step. This means 3 + 2 * 3 = 15, not 9.

# Hint: to solve this problem elegantly, you need to know how the send method
# works in Ruby. If you haven't seen it before, check it out here.

# algo:
# split string on spaces to word array
# start result as 0
# start operations hash with operations as string and methods
# find index of first word that is an integer, save arr[idx] in result
# iterate over words in array with index
#   -if current word is one of hash keys and following word is integer
#     -save those two words as op, num2
#     -look up op in hash
#     -perform calculation, save answer as result
# return result

class WordProblem
  OPS = {
    "plus" => :+,
    "minus" => :-,
    "multiplied" => :*,
    "divided" => :/
  }

  def initialize(str)
    @str = str.gsub(/\?/, "")
              .gsub("multiplied by", "multiplied")
              .gsub("divided by", "divided")
    @words = @str.split
    @result = 0
  end

  def answer
    first_value_to_result
    raise ArgumentError if @words.none? { |word| OPS.keys.include?(word) }
    @words.each_with_index do |word, idx|
      if OPS.keys.include?(word) && @words[idx + 1].match?(/-?\d+/)
        operation = OPS[word]
        num2 = @words[idx + 1].to_i
        @result = @result.send(operation, num2)
      end
    end
    @result
  end

  private

  def first_value_to_result
    first_index = @words.index { |i| i.match?(/-?\d+/) }
    raise ArgumentError if first_index.nil?
    @result = @words[first_index].to_i
  end
end

# LS Student solution (uses String#scan to get all the numbers and operations
# from question):
# class WordProblem
# MATH_SYMBOLS = { 'plus' => :+, 'minus' => :-, 'multiplied' => :*, 'divided' =>
# :/ }

#   def initialize(question)
#     parse(question)

#     raise ArgumentError unless valid_problem?
#   end

#   def answer
#     numbers = @numbers.each

#     @operators.reduce(numbers.next) do |total, operator|
#       total.public_send(MATH_SYMBOLS[operator], numbers.next)
#     end
#   end

#   private

#   def parse(question)
#     @numbers = question.scan(/-?\d+/).map(&:to_i)
#     @operators = question.scan(/#{MATH_SYMBOLS.keys.join('|')}/)
#   end

#   def valid_problem?
#     @numbers.size > 1 && @numbers.size == @operators.size + 1
#   end
# end