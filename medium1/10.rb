# Nth Prime
# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number testing methods in
# the Integer class. For an algorithm to determine whether a number is prime,
# check out this article.

# without saving all the prime numbers in an array:
# class Prime
#   def self.nth(num)
#     start, counter = [2, 1]
#     raise ArgumentError if num <= 0
#     loop do
#       if (2..Math.sqrt(start)).any? { |int| start % int == 0 }
#         start += 1
#       elsif counter == num
#         return start
#       else
#         counter += 1
#         start += 1
#       end
#     end
#   end
# end

# using an array for primes:
# class Prime
#   def self.nth(num)
#     primes = [2]
#     current_val = 3
#     raise ArgumentError if num <= 0
#     until primes.size == num
#       if prime?(current_val)
#         primes << current_val
#       end
#       current_val += 2
#     end
#     primes.last
#   end

#   def self.prime?(val)
#     (2..Math.sqrt(val)).none? { |int| val % int == 0 }
#   end
# end

# only checking prime numbers less than sqrt of current number for divisability:
class Prime
  def self.nth(num)
    primes = [2]
    current_val = 3
    raise ArgumentError if num <= 0
    until primes.size == num
      primes << current_val if prime?(current_val, primes)
      current_val += 2
    end
    primes.last
  end

  def self.prime?(val, primes)
    primes.each do |int|
      return false if val % int == 0
      return true if int > Math.sqrt(val)
    end
  end
end

# p Prime.nth(1) #== 2

# p Prime.nth(2) #== 3

# p Prime.nth(3) #== 5

# p Prime.nth(4) #== 7

# p Prime.nth(5) #== 11
