# Odd Words and the How to Work with a Code Challenge
# We did a live problem solving session and used the "Odd Words" problem to talk
# about the general process of working through a live code challenge.

# Unlike other challenges, this one doesn't come with a complete test suite, so
# you have to work out your own examples(you don't have to write the actual
# tests, just example inputs and outputs). You can watch the first 10 minutes of
# the video on the general process and the problem itself, try to work on the
# problem, and fast forward to 47:20 or so when we discuss the solutions.

# Problem:
# Input is a string of letters, spaces and a point. A word is a combination of
# 1-20 letters. Words are separated by 1 or more spaces. The end of the input is
# the first period (which could have a space in front of it). The output is the
# input text with words separate by a single space and ending with a period. Odd
# words should be reversed in the output.
# Bonus: characters should be read and printed one at a time.

# Q: What happens if a word consists of more than 20 chars?

# Omit bonus and preprocess input string to remove replicate spaces, split to
# array and reverse each odd word
# Use regex to find any 1 or more spaces and sub for a single space.
# Use regex to remove period and add it back in the output.

# A:
# -remove replicate spaces
# -remove period
# -split string on a single space to array
# -iterate through word array with index
#   -if index is even, reverse word
# -join word array to string with spaces between words
# -add period

# def get_output(str)
#   new_str = str.gsub(/[ ]+/, " ").gsub(/[ ]*\./, "")
#   arr = new_str.split
#   new_arr = arr.map.with_index do |word, idx|
#     idx.odd? ? word.reverse : word
#   end
#   final_str = new_arr.join(" ") + "."
# end

# For bonus:
# Need a counter to determine whether word is even or odd. Not possible to
# simultaneously read through string and reverse words.
# Need to be able to determine whether a space is preceded by another space or
# followed by a period.
# My notes:
# -initialize result_str empty
# -iterate through input string with index
# -if char matches a space
#   -if the previous char matches a space,
#     -go to next iteration
#   -if the following char matches a period,
#     -break from iteration
# -else
#   -add char to result_str
# -result_str split to word array
# -iterate through word array with index
#     -if index is odd
#       -reverse word
#     -else
#       -keep word the same
# -join word array to string and add period

# def get_output(str)
#   result_str = ''
#   arr = str.chars
#   arr.each_with_index do |char, idx|
#     if char.match?(/ /)
#       if arr[idx-1].match?(/ /)
#         next
#       elsif arr[idx+1] && arr[idx+1].match?(/\./)
#         break
#       else
#         result_str += char
#       end
#     elsif char.match?(/\./)
#       break
#     else
#       result_str += char
#     end
#   end
#   result_str.split.map.with_index do |word, idx|
#     idx.odd? ? word.reverse : word
#   end.join(" ") + "."
# end

# My notes to simultaneously reverse odd words:
# -initialize result_str empty
# -initialize array of string characters
# -initialize counter to 0
# -initialize word_to_reverse
# -iterate through input string with index
# -if char matches a space
#   -if the previous char matches a space,
#     -go to next iteration
#   -elsif the following char matches a period,
#     -break from iteration
#   -else
#     -add char to result_str
#     -add 1 to counter
# -elsif char matches a period
#   -break
# -else
#   -if counter is even
#     -add char to result_str
#   -elsif counter is odd and following char is a space
#     -add char to word_to_reverse
#     -add word_to_reverse reversed to result_str
#     -make word_to_reverse = ""
#   -elsif counter is odd
#     -add char to word_to_reverse
# -end
# -result_str split to word array
# -iterate through word array with index
#     -if index is odd
#       -reverse word
#     -else
#       -keep word the same
# -join word array to string and add period

# def get_output(str)
#   result_str = ''
#   arr = str.chars
#   counter = 0
#   word_to_reverse = ""
#   arr.each_with_index do |char, idx|
#     if char.match?(/ /)
#       if arr[idx-1].match?(/ /)
#         next
#       elsif arr[idx+1] && arr[idx+1].match?(/\./)
#         break
#       else
#         result_str += char
#         counter += 1
#       end
#     elsif char.match?(/\./)
#       break
#     else
#       if counter.even?
#         result_str += char
#       elsif counter.odd? && arr[idx+1].match?(/ /)
#         word_to_reverse += char
#         result_str += word_to_reverse.reverse
#         word_to_reverse = ""
#       elsif counter.odd?
#         word_to_reverse += char
#       end
#     end
#   end
#   result_str + "."
# end


# My notes to simultaneously reverse odd words:
# -initialize result_str empty
# -initialize array of string characters
# -initialize counter to 0
# -initialize word_to_reverse
# -iterate through input string with index
# -if char matches a space
#   -if the following char matches a letter,
#     -add char to result_str
#     -add 1 to counter
#   -elsif the following char matches a period or a space,
#     -next
# -elsif char matches a period
#   -break
# -else
#   -if counter is even
#     -add char to result_str
#   -elsif counter is odd and following char is a space
#     -add char to word_to_reverse
#     -add word_to_reverse reversed to result_str
#     -make word_to_reverse = ""
#   -elsif counter is odd
#     -add char to word_to_reverse
# -end
# -result_str split to word array
# -iterate through word array with index
#     -if index is odd
#       -reverse word
#     -else
#       -keep word the same
# -join word array to string and add period

# def get_output(str)
#   result_str = ''
#   arr = str.chars
#   counter = 0
#   word_to_reverse = ""
#   arr.each_with_index do |char, idx|
#     if char.match?(/ /)
#       if arr[idx+1].match?(/[a-zA-Z]/)
#         result_str += char
#         counter += 1
#       elsif arr[idx+1] && arr[idx+1].match?(/\.| /)
#         next
#       end
#     elsif char.match?(/\./)
#       break
#     else
#       if counter.even?
#         result_str += char
#       elsif counter.odd? && arr[idx+1].match?(/ /)
#         word_to_reverse += char
#         result_str += word_to_reverse.reverse
#         word_to_reverse = ""
#       elsif counter.odd?
#         word_to_reverse += char
#       end
#     end
#   end
#   result_str + "."
# end

# without switching string to array of characters (use each_char without a
# block, returns an enumerator, call with_index on that):

def get_output(str)
  result_str = ''
  counter = 0
  word_to_reverse = ""
  str.each_char.with_index do |char, idx|
    if char.match?(/ /)
      if str[idx+1].match?(/[a-zA-Z]/)
        result_str += char
        counter += 1
      end
    elsif char.match?(/\./)
      break
    else
      if counter.even?
        result_str += char
      elsif counter.odd? && str[idx+1].match?(/ /)
        word_to_reverse += char
        result_str += word_to_reverse.reverse
        word_to_reverse = ""
      elsif counter.odd?
        word_to_reverse += char
      end
    end
  end
  result_str + "."
end


# Examples:
p get_output("hello.") == "hello."
p get_output("whats the matter with kansas.") == "whats eht matter htiw kansas."
p get_output("whats    the matter with kansas   .") == "whats eht matter htiw kansas."
p get_output("whats the    matter with kansas.") == "whats eht matter htiw kansas."
