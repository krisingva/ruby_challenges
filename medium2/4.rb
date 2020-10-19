# Crypto Square
# Implement the classic method for composing secret messages called a square
# code.

# The input is first normalized: The spaces and punctuation are removed from the
# English text and the message is down-cased.

# Then, the normalized characters are broken into rows. These rows can be
# regarded as forming a rectangle when printed with intervening newlines.

# For example, the sentence

# If man was meant to stay on the ground god would have given us roots

# is 54 characters long.

# Broken into 8-character columns, it yields 7 rows.

# Those 7 rows produce this rectangle when printed one per line:

# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots

# The coded message is obtained by reading down the columns going left to right.
# For example, the message above is coded as:

# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau

# Write a program that, given an English text, outputs the encoded version of
# that text.

# The size of the square (number of columns) should be decided by the length of
# the message. If the message is a length that creates a perfect square (e.g. 4,
# 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit
# neatly into a square, choose the number of columns that corresponds to the
# smallest square that is larger than the number of characters in the message.

# For example, a message 4 characters long should use a 2 x 2 square. A message
# that is 81 characters long would use a square that is 9 columns wide. A
# message between 5 and 8 characters long should use a rectangle 3 characters
# wide.

# Output the encoded text grouped by column.

# My notes:
# # normalize_plaintext:
# -remove anything but alphanumerics from string, downcase
# -get size of string
# #size: (column number)
# -current number set to sqrt of string size rounded down
# -loop
# -for current number, check if number squared is equal to or greater than
# string size
#   -if true
#     -set column number to current number and break
#   -else
#     -add one to current number
# #plaintext_segments:
# -slice string into array of column number chars (#slice!(colnum) until
# string.empty?)
# #normalize_ciphertext:
# -initialize result array empty?
# -from 0 to col num - 1
# -iterate through chars array with current num
# -for current item, save the char that has the current num index and add to
# results array at index current number
# -return results array
# #ciphertext:
# -results array join

class Crypto
  def initialize(str)
    @str = str
    @norm_text = normalize_plaintext
    @size_of_norm_text = @norm_text.length
    @column_num = size
    @segments = plaintext_segments
    @cipher_list = normalize_ciphertext.split
  end

  def normalize_plaintext
    @str.gsub(/[^a-z0-9]/i, "").downcase
  end

  def size
    current_num = Math.sqrt(@size_of_norm_text).floor
    loop do
      return current_num if current_num**2 >= @size_of_norm_text
      current_num += 1
    end
  end

  def plaintext_segments
    list_of_segments = []
    text = @norm_text.dup
    until text.empty?
      list_of_segments << text.slice!(0...@column_num)
    end
    list_of_segments
  end

  def normalize_ciphertext
    list = Array.new(@column_num, "")
    (0...@column_num).each do |num|
      @segments.each do |segment|
        list[num] += segment[num] if segment[num]
      end
    end
    list.join(" ")
  end

  def ciphertext
    @cipher_list.join
  end
end

# LS Solution:
# class Crypto
#   def initialize(text)
#     @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
#   end

#   def normalize_plaintext
#     @normalized_plaintext
#   end

#   def size
#     plain_text_size = @normalized_plaintext.size
#     Math.sqrt(plain_text_size).ceil
#   end

#   def plaintext_segments
#     @normalized_plaintext.scan(/.{1,#{size}}/)
#   end

#   def ciphertext
#     encode_plaintext
#   end

#   def normalize_ciphertext
#     encode_plaintext(' ')
#   end

#   def encode_plaintext(delimiter='')
#     padded_segments = plaintext_segments.map { |string| right_pad(string, size) }
#     padded_segments.map(&:chars).transpose.map(&:join).map(&:strip).join(delimiter)
#   end

#   def right_pad(string, size_limit)
#     string + ' ' * (size_limit - string.size)
#   end
# end