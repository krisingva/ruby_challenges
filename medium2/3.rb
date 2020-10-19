# Pascal's Triangle
# Write a program that computes Pascal's triangle up to a given number of rows.

# In Pascal's Triangle each number is computed by adding the numbers to the
# right and left of the current position in the previous row.

# 1
# 1 1
# 1 2 1
# 1 3 3 1
# 1 4 6 4 1
# # ... etc

class Triangle
  attr_accessor :triangle_rows

  def initialize(num)
    @row_num = num
    @triangle_rows = []
  end

  def rows
    (0..(@row_num - 1)).to_a.each do |int|
      triangle_rows[int] = [0]
      add_to_triangle(int)
      triangle_rows[int] << 0
    end
    cleanup
    triangle_rows
  end

  def add_to_triangle(num)
    if num == 0
      triangle_rows[num] << 1
    elsif num == 1
      2.times { triangle_rows[num] << 1 }
    elsif num > 1
      triangle_rows[num - 1].each_cons(2) do |num1, num2|
        triangle_rows[num] << (num1 + num2)
      end
    end
  end

  def cleanup
    triangle_rows.each do |subarr|
      subarr.pop
      subarr.shift
    end
  end
end

# triangle = Triangle.new(4)
# p triangle.rows.last == [1, 3, 3, 1]

