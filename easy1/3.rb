# Octal
# Implement octal to decimal conversion. Given an octal input string, your
# program should produce a decimal output.

# Note:

# Implement the conversion yourself. Do not use something else to perform the
# conversion for you. Treat invalid input as octal 0.

# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear combination of
# powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next number gets multiplied by 101 = 10
# ...
# The n*th number gets multiplied by 10n-1*.
# All these values are summed.
# So:

#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1
# Octal is similar, but uses powers of 8 rather than powers of 10. So:

#   233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# P:
# -input: string representation of an integer
# -output:octal representation of input integer (number)
# E:
# -Given
# D:
# - string, array
# A:
# -return 0 if input string contains alpha letters or 8 or 9
# -input string transformed to array of integers (num.chars.map(&:to_i))
# -start_num will be array length - 1
# -result = 0
# -iterate through array
#   -multiply the current item with (8**start_num)
#   -add this to result
#   -subtract 1 from start_num
#   -repeat
# -return result
# C:
class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    result = 0
    arr = @num.chars
    return result if arr.any? { |char| char =~ /[a-z8-9]/i }

    num_arr = arr.map(&:to_i)
    start_num = arr.size - 1
    num_arr.each do |digit|
      result += digit * (8**start_num)
      start_num -= 1
    end
    result
  end
end

# p Octal.new('6789').to_decimal == 0
# p Octal.new('abc1z').to_decimal == 0
# p Octal.new('130').to_decimal == 88

# Test suite:

# require 'minitest/autorun'
# require_relative 'octal'

# class OctalTest < Minitest::Test
#   def test_octal_1_is_decimal_1
#     assert_equal 1, Octal.new('1').to_decimal
#   end

#   def test_octal_10_is_decimal_8
#     skip
#     assert_equal 8, Octal.new('10').to_decimal
#   end

#   def test_octal_17_is_decimal_15
#     skip
#     assert_equal 15, Octal.new('17').to_decimal
#   end

#   def test_octal_11_is_decimal_9
#     skip
#     assert_equal 9, Octal.new('11').to_decimal
#   end

#   def test_octal_130_is_decimal_88
#     skip
#     assert_equal 88, Octal.new('130').to_decimal
#   end

#   def test_octal_2047_is_decimal_1063
#     skip
#     assert_equal 1063, Octal.new('2047').to_decimal
#   end

#   def test_octal_7777_is_decimal_4095
#     skip
#     assert_equal 4095, Octal.new('7777').to_decimal
#   end

#   def test_octal_1234567_is_decimal_342391
#     skip
#     assert_equal 342_391, Octal.new('1234567').to_decimal
#   end

#   def test_invalid_octal_is_decimal_0
#     skip
#     assert_equal 0, Octal.new('carrot').to_decimal
#   end

#   def test_8_is_seen_as_invalid_and_returns_0
#     skip
#     assert_equal 0, Octal.new('8').to_decimal
#   end

#   def test_9_is_seen_as_invalid_and_returns_0
#     skip
#     assert_equal 0, Octal.new('9').to_decimal
#   end

#   def test_6789_is_seen_as_invalid_and_returns_0
#     skip
#     assert_equal 0, Octal.new('6789').to_decimal
#   end

#   def test_abc1z_is_seen_as_invalid_and_returns_0
#     skip
#     assert_equal 0, Octal.new('abc1z').to_decimal
#   end

#   def test_valid_octal_formatted_string_011_is_decimal_9
#     skip
#     assert_equal 9, Octal.new('011').to_decimal
#   end

#   def test_234abc_is_seen_as_invalid_and_returns_0
#     skip
#     assert_equal 0, Octal.new('234abc').to_decimal
#   end
# end

# LS Solution:
# class Octal
#   def initialize(str)
#     @digits = str.chars
#   end

#   def to_decimal
#     return 0 if @digits.any? { |digit| digit =~ /[^0-7]/ }
#     @digits
#       .map(&:to_i)
#       .reverse
#       .each_with_index
#       .map { |digit, index| digit * (8 ** index) }
#       .inject(:+)
#   end
# end
