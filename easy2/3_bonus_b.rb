# Beer Song
# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

# Using polymorphism, different classes, all with same method name:

class BeerSong
  def initialize
    @lookup_phrase = Hash.new(MoreThanOne).merge({
      0 => Zero,
      1 => One
    })
  end

  def lyrics
    verses(99, 0)
  end

  def verses(high_num, low_num)
    full_str = ""
    high_num.downto(low_num) do |num|
      full_str += verse(num)
      full_str += "\n" if num > low_num
    end
    full_str
  end

  def verse(num)
    str = ""
    # phrase = phrase(num)
    phrase = @lookup_phrase[num].new.phrase(num)
    str += line_1(phrase)
    phrase = @lookup_phrase[num - 1].new.phrase(num - 1)
    phrase2 = one_or_it(num - 1)
    str += (num < 1 ? line_2_if_none_left : line_2(phrase, phrase2))
    str
  end

  private

  def line_1(phrase)
    "#{phrase.capitalize} of beer on the wall, #{phrase} of beer.\n"
  end

  def line_2_if_none_left
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def line_2(phrase, phrase2)
    "Take #{phrase2} down and pass it around, #{phrase} of beer on the wall.\n"
  end

  def one_or_it(num)
    num > 0 ? "one" : "it"
  end
end

class Zero < BeerSong
  def phrase(num)
    "no more bottles"
  end
end

class One < BeerSong
  def phrase(num)
    "#{num} bottle"
  end
end

class MoreThanOne < BeerSong
  def phrase(num)
    "#{num} bottles"
  end
end

p BeerSong.new.verse(99)

# expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
# "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
# "\n" \
# "98 bottles of beer on the wall, 98 bottles of beer.\n" \
# "Take one down and pass it around, 97 bottles of beer on the wall.\n"
# puts "expected"
# p expected
# puts "actual"
# p BeerSong.new.verses(99, 98)
# p BeerSong.new.verses(99, 98) == expected
