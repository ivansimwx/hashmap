# create hashmap exercise
# for this project, only handle keys of string type
class Hashmap
  # raise IndexError if index.negative? || index >= @buckets.length
  def initialize
    # test
    @buckets = []
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    # takes two arguments, the first is a key and the second is a value that is assigned to this key. 
    # If a key already exists, then the old value is overwritten or we can say that we update the key’s value 
    # (e.g. Carlos is our key but it is called twice: once with value I am the old value., and once with value 
    # I am the new value.. From the logic stated above, Carlos should contain only the latter value).
    @buckets[hash(key)]
  end
end
