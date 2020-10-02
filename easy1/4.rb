# Trinary
# Write a program that will convert a trinary number, represented as a string
# (e.g. '102012'), to its decimal equivalent using first principles (without
# using an existing method or library that can work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary
# entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is the
# 3's place, the third to last is the 9's place, etc.

# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302

# P:
# input: string consisting of 0, 1, 2
# output: number (string converted to decimal number)
# rules:
# - input can only contain 0, 1 and 2 in string form
# - invalid input should output a 0
# - each integer of input string will be multiplied by 3 to the power of a
#   number
# - the number will be determined by the position of the integer in the input
#   string
# - the last integer will have a number 0
# - the number will increment by 1 for the next integer on the left of the
#   previous one
# - once each integer has been multiplied by 3 to the power of the correct
#   number, the products will be summed
# - this sum will be the return value
# E:
# given
# D:
# string, array, integer
# A:
# - convert string to array
# - if any item of array is anything other than 0, 1, 2
#   - return 0
# - reverse array and convert items to integers
# - iterate through array with index
#   - transform each element to item * 3 ** index
# - return sum of array
# C:

# class Trinary
#   def initialize(str)
#     @str = str
#   end

#   def to_decimal
#     arr = @str.split(//)
#     return 0 unless arr.all? {|i| i =~ /[0-2]/}
#     digit_arr = arr.map(&:to_i).reverse
#     new_arr = digit_arr.map.with_index {|item, idx| item * 3 ** idx }
#     new_arr.sum
#   end
# end

# p Trinary.new("102012").to_decimal == 302

# Refactor:

class Trinary
  def initialize(str)
    @str = str
  end

  def to_decimal
    arr = @str.split(//)
    return 0 unless arr.all? { |i| i =~ /[0-2]/ }

    arr.reverse.map.with_index { |item, idx| item.to_i * 3**idx }.sum
  end
end

# LS:
# class Trinary
#   def initialize(str)
#     @trinary = str
#   end

#   def to_decimal
#     return 0 if invalid_trinary?
#     numbers = @trinary.reverse.chars.map(&:to_i)
#     numbers.each_with_index.map { |num, idx| 3**idx * num }.inject(:+)
#   end

#   private

#   def invalid_trinary?
#     @trinary.match(/[^0-2]/)
#   end
# end
