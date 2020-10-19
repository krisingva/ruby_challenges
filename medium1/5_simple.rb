class CircularBuffer
  class BufferFullException < StandardError
  end

  class BufferEmptyException < StandardError
  end

  def initialize(size)
    @size = size
    @buffer = []
  end

  def write(item)
    raise BufferFullException if buffer_full?
    return if item.nil?
    @buffer << item
  end

  def write!(item)
    return if item.nil?
    read if buffer_full?
    write(item)
  end

  def read
    raise BufferEmptyException if buffer_empty?
    returned_item = @buffer[0]
    @buffer.shift
    returned_item
  end

  def clear
    @buffer = []
  end

  private

  def buffer_full?
    @buffer.size == @size
  end

  def buffer_empty?
    @buffer == []
  end
end
