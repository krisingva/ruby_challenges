# Palindrome Products
# Write a program that can detect palindrome products in a given range.

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

# My notes:
# Need a Palindromes class that instantiates an object with one or two
# arguments, a max_factor: (required) and a min_factor: (optional, default 1).
# Need instance methods:
# #generate: gives a list of palindromes
# #smallest: gives an object of a new class Smallest that has its own instance
# methods:
#   #value: gives the value of the palindrome object (the product, as integer)
# #factors: gives an array of subarrays. The subarrays contain items that are an
# array of the factors that give the palindrome value. The subarrays can contain
# the same items in different order.
# #largest: gives an object of a new class Largest that has its own instance
# methods:
#   #value: gives the value of the palindrome object (the product, as integer)
# #factors: gives an array of subarrays. The subarrays contain items that are an
# array of the factors that give the palindrome value. The subarrays can contain
# the same items in different order.

# Rules:
# -A palindrome number is the same as original number if reversed
# -from a range, generate a nested array with subarrays that contain any
# combination of range numbers, no need to repeat the same numbers in alternate
# order ([1, 9] is enough, don't need also [9, 1]).
# -if the product of the subarray is a palindrome number
#   -add it to new array (select)

class Palindromes
  attr_reader :range_list
  attr_accessor :factors_palis

  def initialize(max_factor:, min_factor: 1)
    @min_num = min_factor
    @max_num = max_factor
    @range_list = (@min_num..@max_num).to_a
    @factors_palis = []
  end

  def generate
    factors = all_factors
    self.factors_palis = factors.select do |item1, item2|
      palindrome?(item1 * item2)
    end
    factors_palis
  end

  def smallest
    Smallest.new(factors_palis)
  end

  def largest
    Largest.new(factors_palis)
  end

  private

  def palindrome?(num)
    num.digits == num.digits.reverse
  end

  def all_factors
    factors_all = []
    range_list.each_index do |idx|
      counter = idx
      while counter <= range_list.size - 1
        factors_all << [range_list[idx], range_list[counter]]
        counter += 1
      end
    end
    factors_all
  end
end

class Est
  attr_reader :value

  def initialize(factors_palis)
    @pali_factors = factors_palis
  end

  def factors
    @pali_factors.select { |item1, item2| item1 * item2 == value }
  end
end

class Largest < Est
  def value
    @pali_factors.map { |item1, item2| item1 * item2 }.max
  end
end

class Smallest < Est
  def value
    @pali_factors.map { |item1, item2| item1 * item2 }.min
  end
end

# palindromes = Palindromes.new(9)
# palindromes.generate
# largest = palindromes.largest
# p largest.value == 9
# p largest.factors

# palindromes = Palindromes.new(99, 10)
# palindromes.generate
# largest = palindromes.largest
# p largest.value == 9009
# p largest.factors == [[91, 99]]

# palindromes = Palindromes.new(999, 100)
# palindromes.generate
# smallest = palindromes.smallest
# p smallest.value == 10_201
# p smallest.factors == [[101, 101]]
