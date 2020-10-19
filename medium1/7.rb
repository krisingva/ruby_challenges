# Meetup
# Typically meetups happen on the same day of the week.

# Examples are

# the first Monday
# the third Tuesday
# the Wednesteenth
# the last Thursday

# Note that "Monteenth", "Tuesteenth", etc are all made up words. There was a
# meetup whose members realised that there are exactly 7 days that end in
# '-teenth'. Therefore, one is guaranteed that each day of the week (Monday,
# Tuesday, ...) will have exactly one date that is named with '-teenth' in every
# month.

# Write code that calculates date of meetups.

# My notes:
# Need a Meetup class that instantiates objects with 2 integer arguments that
# represent the month and the year.
# Need an instance method #day that takes 2 symbol arguments, the day of the
# week and the criteria for searching for the right date. The criteria can have
# the following values:
# -:first
# -:second
# -:third
# -:fourth
# -:last
# -:teenth
# where the :teenth argument represents a range of 13-19

require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, criteria)
    weekday = (weekday.to_s + '?').to_sym
    date = Date.new(@year, @month, 1)
    case criteria
    when :first then get_date(date, weekday, 1)
    when :second then get_date(date, weekday, 2)
    when :third then get_date(date, weekday, 3)
    when :fourth then get_date(date, weekday, 4)
    when :teenth then get_date_teenth(date, weekday)
    else get_date_last(date, weekday)
    end
  end

  private

  def get_date(date, weekday, count)
    counter = 0
    loop do
      counter += 1 if date.send(weekday)
      break if counter == count
      date = date.next
    end
    date
  end

  def get_date_teenth(date, weekday)
    teens = (13..19).to_a
    loop do
      break if date.send(weekday) && teens.include?(date.mday)
      date = date.next
    end
    date
  end

  def get_date_last(date, weekday)
    start_month = date.month
    result = date
    loop do
      result = date if date.send(weekday)
      date = date.next
      break if date.month != start_month
    end
    result
  end
end

# Creating a new date object:
# Date.new(year, month, day)
# require 'date'
# date = Meetup.new(3, 2013).day(:monday, :first)
# p date == Date.new(2013, 3, 4)
# p date.mday

# date = Meetup.new(3, 2013).day(:monday, :second)
# p date == Date.new(2013, 3, 11)
# p date.mday

# LS Solution:
# class Meetup
#   def initialize(month, year)
#     @month = month
#     @year = year
#     @schedule_start_day = {
#       first: 1,
#       second: 8,
#       third: 15,
#       fourth: 22,
#       last: -7,
#       teenth: 13
#     }
#   end

#   def day(weekday, schedule)
#     first_day = Date.new(@year, @month, @schedule_start_day[schedule])
#     (first_day..(first_day + 6)).detect {|day| day.public_send(weekday.to_s + '?')}
#   end
# end
