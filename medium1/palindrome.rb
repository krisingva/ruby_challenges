# write a method that checks if a word is a palindrome (the same forward and
# backwards).
# - ignore non-letters ('no1, 2on' is a palindrome)
# - case insensitive
# - can't use #reverse
# - can't use regex

# -input: any characters string
# -output: boolean
# -algo:
# -downcase string
# -initialize empty backward array
# -initialize alpha array
# -split string into char array
# -iterate through char array
#   -for current char, check if included in alpha array
#   - if yes, add char to front of backward array
#   - if not, next
# -join backward array to string
# -check equality of downcase string to backward string

# def palindrome(word)
#   word = word.downcase
#   new_word = ""
#   backward_arr = []
#   alpha_arr = ("a".."z").to_a
#   char_arr = word.split(//)
#   char_arr.each do |char|
#     backward_arr.prepend(char) if alpha_arr.include?(char)
#     new_word += char if alpha_arr.include?(char)
#   end
#   new_word == backward_arr.join
# end

# refactored:

def palindrome(word)
  new_word = ""
  backward_word = ""
  alpha_arr = ("a".."z").to_a
  word.downcase.split(//).each do |char|
    if alpha_arr.include?(char)
      backward_word.prepend(char)
      new_word += char
    end
  end
  new_word == backward_word
end

p palindrome("madam") == true
p palindrome("1a da!") == true
p palindrome("Madam") == true
p palindrome("ad1am") == false
