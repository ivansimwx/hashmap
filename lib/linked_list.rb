# represent full list
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(key, value)
    new_node = Node.new(key, value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend(key, value)
    new_node = Node.new(key, value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def at(index)
    # returns the node at the given index
    current_node = @head
    i = 1
    loop do
      break if current_node.nil? || i > index

      current_node = current_node.next_node
      i += 1
    end

    current_node
  end

  def pop
    # removes the last element from the list
    if @head == @tail
      @head = @tail = nil
      @size = 0
    else
      self.at(@size - 2).next_node = nil
      @tail = self.at(@size - 2)
      @size -= 1
    end
  end

  def contains_value?(value)
    # returns true if the passed in value is in the list and otherwise returns false.
    return false if @head.nil?

    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def contains_key?(key)
    # returns true if the passed in value is in the list and otherwise returns false.
    return false if @head.nil?

    current_node = @head
    until current_node.nil?
      return true if current_node.key == key

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    # returns the index of the node containing value, or nil if not found.
    return nil if @head.nil?

    current_node = @head
    count = 0
    until current_node.nil?
      return count if current_node.value == value

      current_node = current_node.next_node
      count += 1
    end

    nil
  end

  def find_key(key)
    # returns the index of the node containing value, or nil if not found.
    return nil if @head.nil?

    current_node = @head
    count = 0
    until current_node.nil?
      return count if current_node.key == key

      current_node = current_node.next_node
      count += 1
    end

    nil
  end

  def to_s
    # represent your LinkedList objects as strings, so you can print them out and preview them in the console.
    # The format should be: ( value ) -> ( value ) -> ( value ) -> nil
    current_node = @head
    loop do
      print "(#{current_node.value}) -> "
      current_node = current_node.next_node
      break if current_node.nil?
    end
    print "nil\n"
  end

  def insert_at(key, value, index)
    # that inserts a new node with the provided value at the given index.
    if index > @size - 1
      puts "out of bounds"
      return nil
    else
      new_node = Node.new(key, value)
      new_node.next_node = self.at(index) # new node next to update next to index+1 node
      self.at(index-1).next_node = new_node # node at index to update next to new node
      @size += 1
    end
  end

  def remove_at(index)
    # that removes the node at the given index.
    if index > @size - 1
      puts "out of bounds"
      return nil
    elsif index == @size - 1
      self.pop
    else
      self.at(index - 1).next_node = self.at(index).next_node # new node next to update next to index+1 node
      @size -= 1
    end
  end
end
