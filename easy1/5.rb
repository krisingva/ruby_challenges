# Sum of Multiples
# Write a program that, given a number, can find the sum of all the multiples of
# particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of
# these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of
# numbers. If no set of numbers is given, default to 3 and 5.

# P:
# -input: set of integers
# -output: integer
# -rules:
#   - if no set of integers given, set will be 3 and 5
#   - an instance method #to will take an integer argument
# E:
# -given
# D:
# -range, array
# A:
# -initialize results set to 0
# -create a range from 1 to 1 less than integer argument
# -create an array from input integers
# -iterate through input integer array
#   - for current input integer
#   - iterate through range
#     -if current range number is evenly divisible by current input integer
#       -increment results by range number
# -return results
# C:

# First version:
# class SumOfMultiples
#   def initialize(*arg)
#     @input = arg
#     # @input = [3, 5] if @input.empty?
#   end

#   def to(num)
#     results = []
#     range = 1...num
#     @input.each do |int|
#       range.each do |number|
#         results << number if number%int == 0
#       end
#     end
#     results.uniq.sum
#   end

#   def self.to(num)
#     results = []
#     range = 1...num
#     [3, 5].each do |int|
#       range.each do |number|
#         results << number if number%int == 0
#       end
#     end
#     results.uniq.sum
#   end
# end

# second version (creating an object inside the class)
# class SumOfMultiples
#   def initialize(*arg)
#     @input = arg
#   end

#   def self.to(num)
#     obj = self.new(3, 5)
#     obj.to(num)
#   end

#   def to(num)
#     results = []
#     range = 1...num
#     @input.each do |int|
#       range.each do |number|
#         results << number if number%int == 0
#       end
#     end
#     results.uniq.sum
#   end
# end

# refactored:
# class SumOfMultiples
#   def initialize(*arg)
#     @input = arg
#   end

#   def self.to(num)
#     obj = self.new(3, 5).to(num)
#   end

#   def to(num)
#     @input.each_with_object([]) do |int, arr|
#       (1...num).each do |number|
#         arr << number if number%int == 0
#       end
#     end.uniq.sum
#   end
# end

# rubocop fixes:
class SumOfMultiples
  def initialize(*arg)
    @input = arg
  end

  def self.to(num)
    # obj = self.new(3, 5).to(num)
    new(3, 5).to(num)
  end

  def to(num)
    @input.each_with_object([]) do |int, arr|
      (1...num).each do |number|
        arr << number if number % int == 0
      end
    end.uniq.sum
  end
end

# p SumOfMultiples.new(7, 13, 17).to(20) #== 51
# p SumOfMultiples.to(100) #== 2318

# LS:
# class SumOfMultiples
#   def self.to(limit, multiples = [3, 5])
#     (0...limit).select do |number|
#       multiples.any? { |multiple| number % multiple == 0 }
#     end.reduce(:+)
#   end

#   def initialize(*multiples)
#     @multiples = multiples
#   end

#   def to(limit)
#     self.class.to(limit, @multiples)
#   end
# end
