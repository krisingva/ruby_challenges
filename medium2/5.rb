# House
# Write a program that outputs the nursery rhyme "This is the House that Jack
# Built".

# The nursery rhyme reads as follows:
# This is the house that Jack built.

# This is the malt
# that lay in the house that Jack built.

# This is the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# This is the horse and the hound and the horn
# that belonged to the farmer sowing his corn
# that kept the rooster that crowed in the morn
# that woke the priest all shaven and shorn
# that married the man all tattered and torn
# that kissed the maiden all forlorn
# that milked the cow with the crumpled horn
# that tossed the dog
# that worried the cat
# that killed the rat
# that ate the malt
# that lay in the house that Jack built.

# Please build your solution based on this partial program:
class House
  def self.recite
    full_lines = ""
    1.upto(12) do |num|
      line = "This is"
      last_line = " #{pieces[-1][0]}.\n"
      full_lines += (line + last_line) if num == 1
      if num > 1
        extra_lines = ""
        num.downto(2) do |number|
          extra_lines += " #{pieces[-number][0]}\n" + "#{pieces[-number][1]}"
        end
        full_lines += ("\n" + line + extra_lines + last_line)
      end
    end
    full_lines
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

# puts House.recite

# LS Solution:
# class House
#   def self.recite
#     new.recite
#   end

#   def recite
#     (1..pieces.size)
#       .map { |piece| make_verse(pieces.last(piece)) }
#       .join("\n\n") + "\n"
#   end

#   private

#   def make_verse(pieces)
#     verse = pieces.map { |piece| piece.join("\n") }.join(" ")
#     "This is #{verse}."
#   end

#   def pieces
#     [
#       ['the horse and the hound and the horn', 'that belonged to'],
#       ['the farmer sowing his corn', 'that kept'],
#       ['the rooster that crowed in the morn', 'that woke'],
#       ['the priest all shaven and shorn', 'that married'],
#       ['the man all tattered and torn', 'that kissed'],
#       ['the maiden all forlorn', 'that milked'],
#       ['the cow with the crumpled horn', 'that tossed'],
#       ['the dog', 'that worried'],
#       ['the cat', 'that killed'],
#       ['the rat', 'that ate'],
#       ['the malt', 'that lay in'],
#       ['the house that Jack built']
#     ]
#   end
# end
