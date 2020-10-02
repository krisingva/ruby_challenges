# Sieve of Eratosthenes
# Write a program that uses the Sieve of Eratosthenes to find all the primes
# from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime
# numbers up to any given limit. It does so by iteratively marking as composite
# (i.e. not prime) the multiples of each prime, starting with the multiples of
# 2.

# Create your range, starting at two and continuing up to and including the
# given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime) mark all
# the multiples of that number (they are not prime) Repeat until you have
# processed each number in your range. When the algorithm terminates, all the
# numbers in the list that have not been marked are prime. The wikipedia article
# has a useful graphic that explains the algorithm.

# Notice that this is a very specific algorithm, and the tests don't check that
# you've implemented the algorithm, only that you've come up with the correct
# list of primes.

# P:
# -input: integer
# -output: array of prime numbers from 2 to input integer
# -rules:
# -iteration:
# -start at first integer of range of 2 to input (current number)
# -go through rest of numbers in range and mark all the numbers divisible by
# current number
# -make the next unmarked number the current number and repeat
# -return only unmarked numbers from range

# E:
# -given

# D:
# -integer, array

# A:
# -define a class Sieve
# -object of Sieve class should be instantiated with a number (@number)
# -define an instance method primes
# -inside the primes method:
#   -create a range from 2 to @number
#   -initialize a non-prime array
#   -iterate through all the numbers of range:
#     -if current number is included in non-prime array
#       -next
#     -else
#       -iterate through all numbers of range except current number and
#         -if a number is divisible by current number,
#           -put it in non-prime array
#     -end
#   -return range to array with all the values in non-prime array removed

# C:

class Sieve
  def initialize(num)
    @num = num
  end

  # without using index:
  # def primes
  #   arr = (2..@num).to_a
  #   non_prime = []
  #   arr.each do |item|
  #     next if non_prime.include?(item)
  #     arr.each do |value|
  #       next if item == value
  #       non_prime << value if value % item == 0
  #     end
  #   end
  #   arr - non_prime
  # end

  # with index (so we don't start from beginning of range in inner loop):
  def primes
    arr = (2..@num).to_a
    non_prime = []
    arr.each_with_index do |item, idx|
      next if non_prime.include?(item)

      (idx + 1).upto(arr.size - 1) do |current_index|
        next if non_prime.include?(arr[current_index])

        non_prime << arr[current_index] if arr[current_index] % item == 0
      end
    end
    arr - non_prime
  end
end

# LS solution:

# class Sieve
#   attr_reader :range

#   def initialize(last_num)
#     @range = (2..last_num).to_a
#   end

#   def primes
#     range.each do |prime|
#       range.reject! { |num| (num != prime) && (num % prime == 0) }
#     end
#     range
#   end

# end

# p Sieve.new(10).primes == [2, 3, 5, 7]
# p Sieve.new(1000).primes == [
#       2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
#       61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
#       131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
#       193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
#       263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331,
#       337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401,
#       409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
#       479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
#       569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631,
#       641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709,
#       719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
#       809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
#       881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967,
#       971, 977, 983, 991, 997
#     ]

# Test suite:

# require 'minitest/autorun'
# require_relative '2.rb'

# class SieveTest < Minitest::Test
#   def test_a_few_primes
#     expected = [2, 3, 5, 7]
#     assert_equal expected, Sieve.new(10).primes
#   end

#   def test_primes
#     skip
#     expected = [
#       2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
#       61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127,
#       131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191,
#       193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257,
#       263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331,
#       337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401,
#       409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467,
#       479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563,
#       569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631,
#       641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709,
#       719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797,
#       809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877,
#       881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967,
#       971, 977, 983, 991, 997
#     ]
#     assert_equal expected, Sieve.new(1000).primes
#   end
# end
