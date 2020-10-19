# Perfect Number
# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers, identifying each as belonging uniquely to the categories of abundant,
# perfect, or deficient. A perfect number equals the sum of its positive
# divisors, the pairs of numbers whose product yields the target number,
# excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number

# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.

# P:
# Given a number, find all of its positive divisors (besides the number itself)
# and add them up.
# If the sum is equal to the number, it's perfect.
# If the sum is less than the number, it's deficient.
# If the sum is more than the number, it's abundant.

# write a class method `PerfectNumber::classify` that takes a number and returns
# a choice of three strings

# input: positive number
# if input is other than positive number, raise StandardError
# output: a string (choice of three strings)

# E:
# given

# D:
# string, integer, range, array

# A:
# raise StandardError if input not of Integer class and not higher than 0
# 1. find divisors:
# - create a range from 1 to half of input number, convert to array
# - select items from array that gives 0 remainder when number is divided by
#   item
# 2. sum up divisors
# - sum all the items from array
# 3. compare number to sum
# - return appropriate string depending on comparison

# class PerfectNumber
#   def self.classify(number)
#     raise StandardError if number.class != Integer || number < 0

#     divisors = (1..number / 2).to_a.select { |item| number % item == 0 }
#     sum = divisors.sum
#     if sum == number
#       'perfect'
#     elsif sum > number
#       'abundant'
#     elsif sum < number
#       'deficient'
#     end
#   end
# end

# refactored:
class PerfectNumber
  def self.classify(number)
    raise StandardError if number.class != Integer || number < 0

    sum = (1..number / 2).select { |item| number % item == 0 }.reduce(:+)
    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    elsif sum < number
      'deficient'
    end
  end
end

# refactored but not better:
# class PerfectNumber
#   def self.classify(number)
#     raise StandardError if number.class != Integer || number < 0

#     arr = []
#     1.upto(number / 2) { |int| arr << int if number % int == 0 }
#     sum = arr.reduce(:+)

#     if sum == number
#       'perfect'
#     elsif sum > number
#       'abundant'
#     elsif sum < number
#       'deficient'
#     end
#   end
# end

# From LS:
# class PerfectNumber
#   def self.sum_of_factors(number)
#     sum = 1
#     (2..number / 2).to_a.each do |num|
#       sum += num if number % num == 0
#     end
#     sum
#   end

#   def self.classify(number)
#     raise StandardError if number <= 0

#     factors = sum_of_factors(number)
#     case
#     when factors < number
#       'deficient'
#     when factors == number
#       'perfect'
#     when factors > number
#       'abundant'
#     end
#   end
# end
