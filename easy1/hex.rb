class Hex
  HEX = {
    "a" => 10,
    "b" => 11,
    "c" => 12,
    "d" => 13,
    "e" => 14,
    "f" => 15
  }

  def initialize(str)
    @str = str.downcase
  end

  def to_decimal
    arr = @str.split(//)
    return 0 unless arr.all? {|i| i =~ /[0-9a-f]/i}
    arr.reverse.map.with_index do |item, idx|
      HEX.keys.include?(item)? HEX[item]* 16 ** idx : item.to_i * 16 ** idx
    end.sum
  end
end

p Hex.new("1e34").to_decimal == 7732
p Hex.new("1H34").to_decimal == 0