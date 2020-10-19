# Phone Number
# Write a program that cleans up user-entered phone numbers so that they can be
# sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is bad number If the
# phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use
# the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a
# bad number
# If the phone number is more than 11 digits assume that it is a bad number

class PhoneNumber
  def initialize(str)
    @num_str = str
    @num_digits = @num_str.chars.select { |i| i.match?(/[0-9]/) }.join
  end

  def number
    return '0000000000' if invalid_number?
    clean_up_number
  end

  def to_s
    number
    "(#{@num_digits[0, 3]}) #{@num_digits[3, 3]}-#{@num_digits[6, 4]}"
  end

  def area_code
    @num_digits[0, 3]
  end

  private

  def invalid_number?
    return true if @num_str.match?(/[a-z]/i)
    return true if @num_digits.size < 10 || @num_digits.size > 11
    return true if @num_digits.size == 11 && @num_digits[0] != '1'
  end

  def clean_up_number
    @num_digits = @num_digits[1..-1] if @num_digits.size == 11
    @num_digits
  end
end
