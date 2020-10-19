# Clock
# Create a clock that is independent of date.

# You should be able to add and subtract minutes to it. Two clocks that
# represent the same time should be equal to each other.

class Clock
  attr_accessor :minutes, :hour

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def +(min)
    new_clock = Clock.at(hour, minutes)
    adding = new_clock.minutes + min
    set_clock(new_clock, adding)
  end

  def -(min)
    new_clock = Clock.at(hour, minutes)
    subtracting = new_clock.minutes - min
    set_clock(new_clock, subtracting)
  end

  def to_s
    format('%02d:%02d', @hour, @minutes)
  end

  def ==(other)
    hour == other.hour && minutes == other.minutes
  end

  private

  def set_clock(clock, min)
    set_hour, set_minutes = min.divmod(60)
    clock.hour += set_hour
    clock.hour = clock.hour % 24
    clock.minutes = set_minutes
    clock
  end
end

# p Clock.at(9).to_s == '09:00'
# clock = Clock.at(10, 20) + 61
# p clock.to_s == '11:21'
# clock = Clock.at(10, 20) + 21
# p clock.to_s == '10:41'
# clock = Clock.at(10) - 90
# p clock.to_s == '08:30'
