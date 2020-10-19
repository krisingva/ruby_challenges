# Circular Buffer
# A circular buffer, cyclic buffer or ring buffer is a data structure that uses
# a single, fixed-size buffer as if it were connected end-to-end.

# A circular buffer first starts empty and of some predefined length. For
# example, this is an empty 7-element buffer:

# [ ][ ][ ][ ][ ][ ][ ]
# Assume that a 1 is written into the middle of the buffer (exact starting
# location does not matter in a circular buffer):

# [ ][ ][ ][1][ ][ ][ ]
# Then assume that two more elements are added, or written to the buffer — 2 & 3
# — which get appended after the 1:

# [ ][ ][ ][1][2][3][ ]
# If two elements are then read, or removed from the buffer, the oldest values
# inside the buffer are removed. The two elements removed, in this case, are 1 &
# 2, leaving the buffer with just a 3:

# [ ][ ][ ][ ][ ][3][ ]
# If the buffer has 7 elements then it is completely full:

# [6][7][8][9][3][4][5]
# When the buffer is full an error will be raised, alerting the client that
# further writes are blocked until a slot becomes free.

# The client can opt to overwrite the oldest data with a forced write. In this
# case, two more elements — A & B — are added and they overwrite the 3 & 4:

# [6][7][8][9][A][B][5]

# Finally, if two elements are now removed then what would be returned is not 3
# & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:

# [ ][7][8][9][A][B][ ]

# If you need a refresher on how to raise an error, take the time to revisit
# Launch School's article on Getting Started with Ruby Exceptions.

# My notes:
# write method: adding to buffer, to the end
# read method: removing from buffer, from the front
# overwrite method: replace items in buffer with other items, that is remove
# enough items to be able to add the new items. In essence, reading + writing.

class CircularBuffer
  class BufferFullException < StandardError
  end

  class BufferEmptyException < StandardError
  end

  def initialize(size)
    @size = size
    @buffer = Array.new(@size)
  end

  def write(item)
    raise BufferFullException if buffer_full?
    return if item.nil?
    if buffer_empty?
      @buffer[0] = item
    else
      idx = @buffer.rindex { |i| !i.nil? }
      @buffer[(idx + 1) % @size] = item
    end
  end

  def write!(item)
    return if item.nil?
    read if buffer_full?
    write(item)
  end

  def read
    raise BufferEmptyException if buffer_empty?
    idx = @buffer.index { |item| !item.nil? }
    returned_item = @buffer[idx]
    @buffer[idx] = nil
    @buffer.rotate!
    returned_item
  end

  def clear
    @buffer.map! { |_| nil }
  end

  private

  def buffer_full?
    @buffer.all? { |item| !item.nil? }
  end

  def buffer_empty?
    @buffer.all?(&:nil?)
  end
end
