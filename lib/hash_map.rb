# create hashmap exercise
# for this project, only handle keys of string type
class HashMap
  # raise IndexError if index.negative? || index >= @buckets.length
  @@load_factor = 0.75
  attr_accessor :buckets, :capacity

  def initialize
    # test
    @buckets = []
    @capacity = 16
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code + char.ord) % @capacity }

    hash_code
  end

  def set(key, value)
    bucket = @buckets[hash(key)]
    if bucket&.contains_key?(key)
      current_node = bucket.head
      current_node = current_node.next_node unless current_node.key == key
      current_node.value = value
    elsif bucket
      bucket.append(key, value)
    else
      new_list = LinkedList.new
      new_list.append(key, value)
      @buckets[hash(key)] = new_list
      # puts "length is #{length}, capacity is #{@capacity}, load factor is #{length.to_f/@capacity}"
    end
    grow? if (length.to_f / @capacity) > @@load_factor
  end

  def grow?
    # if load factor exceeded, grow buckets and reorganise
    @capacity *= 2
    current_entries = entries
    clear
    current_entries.each do |element|
      # puts "key #{element[0]}, value #{element[1]}"
      set(element[0], element[1])
    end
  end

  def get(key)
    bucket = @buckets[hash(key)]
    return unless bucket&.contains_key?(key)

    current_node = bucket.head
    current_node = current_node.next_node unless current_node.key == key
    current_node.value
  end

  def has?(key)
    bucket = @buckets[hash(key)]
    bucket&.contains_key?(key) ? true : false
  end

  def remove(key)
    bucket = @buckets[hash(key)]
    return unless bucket&.contains_key?(key)

    index = bucket.find_key(key)
    bucket.remove_at(index)
  end

  def length
    count = 0
    @buckets.each do |element|
      count += element.size if element
    end

    count
  end

  def clear
    @buckets = []
  end

  def keys
    keys_array = []
    @buckets.each do |element|
      current_node = element&.head
      until current_node.nil?
        keys_array.push(current_node.key)
        current_node = current_node.next_node
      end
    end
    keys_array
  end

  def values
    values_array = []
    @buckets.each do |element|
      current_node = element&.head
      until current_node.nil?
        values_array.push(current_node.value)
        current_node = current_node.next_node
      end
    end
    values_array
  end

  def entries
    entries_array = []
    @buckets.each do |element|
      current_node = element&.head
      until current_node.nil?
        entries_array.push([current_node.key, current_node.value])
        current_node = current_node.next_node
      end
    end
    entries_array
  end
end
