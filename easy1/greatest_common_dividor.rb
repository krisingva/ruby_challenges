# Build a method that will return the greatest common divider of two positive
# integers

#take each number and a range from 1 upto number.
# for each integer in range, determine if is divisible by number
# if so, add to resuts array
# do the same for othere number

# join the two results arrays into one array
# sort by biggest to smallest
# go through each item and check if it is present in both results arrays
# return the first one the is

def gcd(a,b)
  a_results = []
  a_range = 1..a
  a_range.each {|int| a_results << int if a%int == 0}
  b_results = []
  b_range = 1..b
  b_range.each {|int| b_results << int if b%int == 0}
  joined_array = a_results + b_results
  new_arr = joined_array.sort.reverse
  new_arr.each do |item|
    return item if a_results.include?(item) && b_results.include?(item)
  end
end

p gcd(9, 15) == 3
p gcd(100, 11) == 1
p gcd(14, 28) == 14
p gcd(27, 70) == 1

# LS:
# def gcd(a,b)
#   minimum = [a, b].min
#   minimum.downto(1) do |divisor|
#     return divisor if a%divisor == 0 && b%divisor == 0
#   end
# end