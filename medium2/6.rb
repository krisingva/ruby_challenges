# Robot Name
# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random: they should not follow a predictable sequence.
# Random names means a risk of collisions. Your solution should not allow the
# use of the same name twice when avoidable.

class Robot
  ALPH = ("A".."Z").to_a
  NUM = (0..9).to_a.map(&:to_s)
  @@taken = []

  attr_reader :name

  def initialize
    @name = generate_name
    @@taken << @name
  end

  def generate_name
    str = ""
    loop do
      [ALPH, ALPH, NUM, NUM, NUM].each do |arr|
        str << arr.sample
      end
      @@taken.none? { |item| item == str } ? break : str = ""
    end
    str
  end

  def reset
    @@taken.delete(@name)
    self.name = generate_name
  end

  private

  attr_writer :name
end

# p Robot.new.name
