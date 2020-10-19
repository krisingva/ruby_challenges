# Secret Handshake
# Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and
# those who don't. You and your fellow cohort of those in the "know" when it
# comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump

# 10000 = Reverse the order of the operations in the secret handshake.

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]

# The program should consider strings specifying an invalid binary as the value
# 0.

# Solve by using the index of binary array to fetch items from BINARY_ACTIONS
# array

class SecretHandshake
  attr_reader :commands

  BINARY_ACTIONS = ["wink", "double blink", "close your eyes", "jump"].freeze

  def initialize(input)
    @input = input
    validate_input
    @binary_array = cleanup_input
    @commands = add_actions
    @commands.reverse! if reverse_actions?
  end

  def validate_input
    raise InputError, "invalid input" unless
    @input.class == Integer ||
    @input.class == String &&
    string_valid?
  end

  def cleanup_input
    binary = ''
    if @input.class == Integer
      binary = decimal_to_binary(@input)
    elsif @input.class == String
      binary = @input if string_valid?
    end
    binary.chars.reverse
  end

  def string_valid?
    @input == @input.to_i.to_s && !@input.match?(/[2-9]/)
  end

  def decimal_to_binary(num)
    arr = []
    until num == 0
      num, remainder = num.divmod(2)
      arr.prepend(remainder)
    end
    arr.join
  end

  def add_actions
    arr = []
    @binary_array.each_with_index do |int, idx|
      arr << BINARY_ACTIONS[idx] if int == 1
      break if idx >= 3
    end
    arr
  end

  def reverse_actions?
    @binary.array.size >= 5
  end
end

class InputError < StandardError
end
