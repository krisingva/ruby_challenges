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

# My notes:
# Need a class SecretHandshake that will instantiate objects with an argument.
# If the argument is an integer, convert integer to binary and use binary to
# create a list of operations for handshake (#commands).
# If the argument is a string, validate that the string is a valid binary.
# If valid binary, create list of operations.
# If not valid, give a binary of 0 and an empty list of operations.

class SecretHandshake
  BINARY_ACTIONS = {
    10000 => "reverse",
    1000 => "jump",
    100 => "close your eyes",
    10 => "double blink",
    1 => "wink"
  }.freeze

  def initialize(input)
    @input = input
    @binary = 0
    @actions = []
    @reverse_action = false
    validate_input
  end

  def validate_input
    if @input.class == Integer
      integer_to_binary
    elsif @input.class == String
      string_to_binary if string_valid?
    else
      raise InputError, "invalid input"
    end
  end

  def integer_to_binary
    @binary = decimal_to_binary(@input)
  end

  def string_valid?
    @input == @input.to_i.to_s && !@input.match?(/[2-9]/)
  end

  def string_to_binary
    @binary = @input.to_i
  end

  def decimal_to_binary(num)
    arr = []
    until num == 0
      num, remainder = num.divmod(2)
      arr.prepend(remainder)
    end
    arr.join.to_i
  end

  def commands
    add_actions
    @actions.reverse!
    reverse_commands?
    @actions
  end

  def add_actions
    BINARY_ACTIONS.each do |num, action|
      if @binary / num >= 1 && num == 10000
        @reverse_action = true
        @binary -= num
      elsif @binary / num >= 1
        @actions << action
        @binary -= num
      end
    end
  end

  def reverse_commands?
    @actions.reverse! if @reverse_action
  end
end

class InputError < StandardError
end
