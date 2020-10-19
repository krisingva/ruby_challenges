# Roman Numerals
# The Romans were a clever bunch. They conquered most of Europe and ruled it for
# hundreds of years. They invented concrete and straight roads and even bikinis.
# One thing they never discovered though was the number zero. This made writing
# and dating extensive histories of their exploits slightly more challenging,
# but the system of numbers they came up with is still in use today. For example
# the BBC uses Roman numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these
# letters have lots of straight lines and are hence easy to hack into stone
# tablets).

#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The
# Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit
# separately starting with the left most digit and skipping any digit with a
# value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990
# is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII
# See also: http://www.novaroma.org/via_romana/numbers.html

# My notes:
# Need a #to_roman method that can be called on integers and returns the
# equivalent roman numeral as a string.
# Example:
# 575 = [5, 7, 5]
# size is 3
# arr[-3] = 5, becomes 5*10**(size -1)
# arr[-2] = 7, becomes 5*10**(size-2), 1*10**(size-2), 1*10**(size-2)
# arr[-1] = 5, becomes 5*10**(size-3)

# ROMAN_NUMS = {
#   1 => 'I',
#   2 => 'II',
#   3 => 'III',
#   4 => 'IV',
#   5 => 'V',
#   6 => 'VI',
#   7 => 'VII',
#   8 => 'VIII',
#   9 => 'IX',
#   10 => 'X',
#   20 => 'XX',
#   30 => 'XXX',
#   40 => 'XL',
#   50 => 'L',
#   60 => 'LX',
#   70 => 'LXX',
#   80 => 'LXXX',
#   90 => 'XC',
#   100 => 'C',
#   200 => 'CC',
#   300 => 'CCC',
#   400 => 'CD',
#   500 => 'D',
#   600 => 'DC',
#   700 => 'DCC',
#   800 => 'DCCC',
#   900 => 'CM',
#   1000 => 'M',
#   2000 => 'MM',
#   3000 => 'MMM'
# }

# class Integer
#   def to_roman
#     arr = digits.reverse
#     size = arr.size
#     counter = -size
#     second_counter = 1
#     transform_number_to_roman_value(arr, size, counter, second_counter)
#   end

#   def transform_number_to_roman_value(arr, size, counter, second_counter)
#     str = ''
#     until second_counter > size
#       curr_val = arr[counter] * 10**(size - second_counter)
#       str << ROMAN_NUMS[curr_val] unless curr_val == 0
#       counter += 1
#       second_counter += 1
#     end
#     str
#   end
# end

# LS solution:
# class Fixnum
#   ROMAN_NUMERALS =
#   {
#     1000 => 'M',
#     900 => 'CM',
#     500 => 'D',
#     400 => 'CD',
#     100 => 'C',
#     90 => 'XC',
#     50 => 'L',
#     40 => 'XL',
#     10 => 'X',
#     9 => 'IX',
#     5 => 'V',
#     4 => 'IV',
#     1 => 'I'
#   }

#   def to_roman
#     keys = ROMAN_NUMERALS.keys
#     remaining = self
#     roman_numeral = ''

#     while remaining > 0
#       keys.each do |key|
#         next if remaining < key
#         multiplier = remaining / key
#         remaining = remaining % key
#         roman_numeral << ROMAN_NUMERALS[key] * multiplier
#       end
#     end

#     roman_numeral
#   end
# end

# # My replication of LS solution:
# class Integer
#   ROMAN_NUMS = {
#     1000 => 'M',
#     900 => 'CM',
#     500 => 'D',
#     400 => 'CD',
#     100 => 'C',
#     90 => 'XC',
#     50 => 'L',
#     40 => 'XL',
#     10 => 'X',
#     9 => 'IX',
#     5 => 'V',
#     4 => 'IV',
#     1 => 'I'
#   }

#   def to_roman
#     str = ''
#     number = self
#     ROMAN_NUMS.each do |key, value|
#       multiplier = number / key
#       str += value * multiplier
#       number -= key * multiplier
#     end
#     str
#   end
# end

# Replication of LS student solution:
class Integer
  ROMAN_ARR = [
    {1 => 'I', 5 => 'V'},
    {1 => 'X', 5 => 'L'},
    {1 => 'C', 5 => 'D'},
    {1 => 'M'}
  ]

  def to_roman
    digits = self.digits
    results_arr = []
    digits.size.downto(0) do |idx|
      roman_num = ROMAN_ARR[idx]
      digit = digits[idx]
      str = ''
      case digit
      when 1..3
        multiplier = digit / 1
        str = roman_num[1] * multiplier
      when 4..5
        if 5 % digit == 0
          str = roman_num[5]
        else
          str = roman_num[1] + roman_num[5]
        end
      when 6..8
        multiplier = digit % 5
        str = roman_num[5] + roman_num[1] * multiplier
      when 9
        str = roman_num[1] + ROMAN_ARR[idx+1][1]
      end
      results_arr.prepend(str)
    end
    results_arr.reverse.join
  end
end

p 2943.to_roman == 'MMCMXLIII'
p 1990.to_roman == 'MCMXC'
