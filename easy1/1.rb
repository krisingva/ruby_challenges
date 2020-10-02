# Series
# Write a program that will take a string of digits and give you all the
# possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
#   And if you ask for a 6-digit series from a 5-digit string, you deserve
#   whatever you get.

# P:
# input: a string of integers
# output: a nested array, subarrays contain integer items from input string
# rules:
# -an integer argument will be passed into method
# -each subarray will be the length of argument
# -the subarrays will contain items in integer form, not string
# -the first subarray will have the first input string integer as the first item
# and so on for the predetermined length of subarray
# -the second subarray will have the second input string integer as the first
# item and so on for the predetermined length of subarray
# -the last subarray will start at the input string integer that is argument
# integer away from the last string integer
# -if integer argument is higher than the size of the input string, should
# return an ArgumentError

# E:
# -given

# D:
# -string, array

# A:
# -define a `Series` class
# -a `Series` object will be initialized with an input string
# -define an instance method `slices` that takes a `size` argument
# -inside `slices`:
# -set `result_array` as empty array
# -split calling object input string into array of integers (#chars, #map) and
# assign to `array` variable
# -iterate through `array` with index
#   -if index is less than `array` length - `size`
#     -at current index:
# -create an array that contains items from `array` that starts at index and is
# of `size` length
#     -add this array to result_array
#     (`array.slice(index, size)` to `result_array`)
#   -end of if statement
# -return results array

# C:

class Series
  def initialize(str)
    @str = str
  end

  # using iteration:

  def slices(size)
    result_array = []
    arr = @str.chars.map(&:to_i)
    raise ArgumentError if size > arr.length

    last_pos = arr.length - size
    arr.each_with_index do |_, idx|
      result_array << arr[idx, size] if idx <= last_pos
      # result_array << arr.slice(idx, size) if idx <= last_pos
    end
    result_array
  end

  # Using Enumerable#each_cons(n) {...}:
  # def slices(size)
  #   result_array = []
  #   arr = @str.chars.map(&:to_i)
  #   raise ArgumentError if size > arr.length
  #   arr.each_cons(size) { |subarr| result_array << subarr }
  #   result_array
  # end
end

# series = Series.new('01234')
# p series.slices(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]

# Test suite:

# require 'minitest/autorun'
# require_relative 'series'

# class SeriesTest < Minitest::Test
#   def test_simple_slices_of_one
#     series = Series.new('01234')
#     assert_equal [[0], [1], [2], [3], [4]], series.slices(1)
#   end

#   def test_simple_slices_of_one_again
#     skip
#     series = Series.new('92834')
#     assert_equal [[9], [2], [8], [3], [4]], series.slices(1)
#   end

#   def test_simple_slices_of_two
#     skip
#     series = Series.new('01234')
#     assert_equal [[0, 1], [1, 2], [2, 3], [3, 4]], series.slices(2)
#   end

#   def test_other_slices_of_two
#     skip
#     series = Series.new('98273463')
#     expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
#     assert_equal expected, series.slices(2)
#   end

#   def test_simple_slices_of_two_again
#     skip
#     series = Series.new('37103')
#     assert_equal [[3, 7], [7, 1], [1, 0], [0, 3]], series.slices(2)
#   end

#   def test_simple_slices_of_three
#     skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2], [1, 2, 3], [2, 3, 4]], series.slices(3)
#   end

#   def test_simple_slices_of_three_again
#     skip
#     series = Series.new('31001')
#     assert_equal [[3, 1, 0], [1, 0, 0], [0, 0, 1]], series.slices(3)
#   end

#   def test_other_slices_of_three
#     skip
#     series = Series.new('982347')
#     expected = [[9, 8, 2], [8, 2, 3], [2, 3, 4], [3, 4, 7]]
#     assert_equal expected, series.slices(3)
#   end

#   def test_simple_slices_of_four
#     skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2, 3], [1, 2, 3, 4]], series.slices(4)
#   end

#   def test_simple_slices_of_four_again
#     skip
#     series = Series.new('91274')
#     assert_equal [[9, 1, 2, 7], [1, 2, 7, 4]], series.slices(4)
#   end

#   def test_simple_slices_of_five
#     skip
#     series = Series.new('01234')
#     assert_equal [[0, 1, 2, 3, 4]], series.slices(5)
#   end

#   def test_simple_slices_of_five_again
#     skip
#     series = Series.new('81228')
#     assert_equal [[8, 1, 2, 2, 8]], series.slices(5)
#   end

#   def test_simple_slice_that_blows_up
#     skip
#     series = Series.new('01234')
#     assert_raises ArgumentError do
#       series.slices(6)
#     end
#   end

#   def test_more_complicated_slice_that_blows_up
#     skip
#     slice_string = '01032987583'

#     series = Series.new(slice_string)
#     assert_raises ArgumentError do
#       series.slices(slice_string.length + 1)
#     end
#   end
# end
