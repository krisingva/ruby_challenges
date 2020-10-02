# Point Mutations
# Write a program that can calculate the Hamming distance between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying of a
# nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
# functions, mutations tend to cause a ripple effect throughout the cell.
# Although mutations are technically mistakes, a very rare mutation may equip
# the cell with a beneficial attribute. In fact, the macro effects of evolution
# are attributable by the accumulated result of beneficial microscopic mutations
# over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

# P:
# - input: two strings consisting of 'A', 'G', 'C' and 'T' of any length
# - output: the number of mismatches between the two strings
# - rules:
#   - if strings are of unequal length
#     - comparison will only be done over the shorter length
# E:
# - given
# D:
# - string, array
# A:
# - initialize count to 0
# - compare the length of input strings
#   - if one is shorter, assign to short in array format, other to long in array
#     format
#   - else pick the first one to assign to short (array), second to long (array)
# - iterate over short chars with index
#     - at current index, compare short char to long char
#     - if not the same, add to count
# - return count
# C:

# class DNA
#   def initialize(strand1)
#     @strand1 = strand1
#   end

#   def hamming_distance(strand2)
#     arr = [@strand1.chars, strand2.chars].sort_by { |a| a.length }
#     short, long = arr[0], arr[1]
#     count = 0
#     short.each_index { |idx| count += 1 if short[idx] != long[idx] }
#     count
#   end
# end

# rubocop fixes:

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    arr = [@strand1.chars, strand2.chars].sort_by(&:length)
    short = arr[0]
    long = arr[1]
    count = 0
    short.each_index { |idx| count += 1 if short[idx] != long[idx] }
    count
  end
end

# LS:
# class DNA # :nodoc:
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(other)
#     length = [@strand.size, other.size].min - 1

#     (0..length).reduce(0) do |distance, idx|
#       @strand[idx] == other[idx] ? distance : distance + 1
#     end
#   end
# end
