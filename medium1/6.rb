# Grade School
# Write a small archiving program that stores students' names along with the
# grade that they are in.

# In the end, you should be able to:

# Add a student's name to the roster for a grade
# "Add Jim to grade 2."
# "OK."
# Get a list of all students enrolled in a grade
# "Which students are in grade 2?"
# "We've only got Jim just now."
# Get a sorted list of all students in all grades. Grades should sort as 1, 2,
# 3, etc., and students within a grade should be sorted alphabetically by name.

# {1=>["Anna", "Barb", "Charlie"], 2=>["Alex", "Peter"], ...}
# The exact output format doesn't matter: what's important is that it shows all
# of the students and grades in the proper order.

# Note that all our students only have one name. (It's a small town, what do you
# want?)

# My notes:
# -Need a School class that initializes without an argument
# -an instance variable @classes that is a hash that contains key-value pairs:
# {grade => [name, name2]}
# -an instance method #add that takes a string and an integer that will be added
# to @classes hash as a key-value pair: [integer, string]
# -an instance method #grade that takes an integer and returns an array
# containing all the values associated with the integer key
# -an instance method #to_h that builds a hash where the grades are the keys and
# the names are the values

class School
  def initialize
    @classes = Hash.new([])
  end

  def add(name, level)
    @classes.key?(level) ? @classes[level] << name : @classes[level] = [name]
  end

  def grade(level)
    @classes[level]
  end

  def to_h
    @classes.sort.map do |subarr|
      subarr.map.with_index do |item, idx|
        idx == 0 ? item : item.sort
      end
    end.to_h
  end
end
